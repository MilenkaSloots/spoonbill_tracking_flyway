##########################################################################
### SUPPORTING FUNCTIONS - MOVEMENT STATISTICS                         ####
###                                                                    ####
### by Wouter M.G. Vansteelant (wouter@birdeyes.org)                   ####
### Updated Oct 2026 for the Flyway Ecology course (University of     ####
### Groningen). These versions only use base R, so they work inside   ####
### dplyr::mutate() on grouped data.                                  ####
##########################################################################

# Mean Earth radius in km (IUGG). Distances on a sphere differ from the
# WGS84 ellipsoid by <0.5%, which is negligible for GPS tracking data.
earth_radius_km <- 6371.0088

## Great-circle (haversine) distance between two sets of coordinates ##
## Output in metres. Vectorised: works on whole columns at once.     ##
gc_distance <- function(lat1, long1, lat2, long2){
  rad  <- pi/180
  dlat <- (lat2 - lat1) * rad
  dlon <- (long2 - long1) * rad
  a    <- sin(dlat/2)^2 + cos(lat1*rad) * cos(lat2*rad) * sin(dlon/2)^2
  2 * earth_radius_km * 1000 * asin(pmin(1, sqrt(a)))
}

## Initial bearing (direction of movement) from point 1 to point 2  ##
## Output in degrees on the GPS scale, from -180 to 180 (0 = north,  ##
## 90 = east, -90 = west).                                           ##
gc_bearing <- function(lat1, long1, lat2, long2){
  rad  <- pi/180
  dlon <- (long2 - long1) * rad
  y    <- sin(dlon) * cos(lat2*rad)
  x    <- cos(lat1*rad) * sin(lat2*rad) - sin(lat1*rad) * cos(lat2*rad) * cos(dlon)
  atan2(y, x) / rad
}

## Point-to-point movement statistics for every fix ##
## For each fix: distance (m), duration (s), direction (deg) and speed (m/s)
## to the NEXT fix of the same individual ('forward' statistics, as in
## sidescript_pt2pt_fxns.R), plus the speed from the PREVIOUS fix (spd_in),
## which we need to recognise isolated position spikes.
##
## data: a data frame with columns ID, dt (POSIXct), lat and long.
calc_movestats <- function(data){
  data %>%
    arrange(ID, dt) %>%
    group_by(ID) %>%
    mutate(dist   = gc_distance(lat, long, dplyr::lead(lat), dplyr::lead(long)),
           dur    = as.numeric(difftime(dplyr::lead(dt), dt, units = "secs")),
           dir    = gc_bearing(lat, long, dplyr::lead(lat), dplyr::lead(long)),
           spd    = dist/dur,
           spd_in = dplyr::lag(spd)) %>%
    ungroup()
}

## Distance (m) from every fix to a fixed point of interest (e.g. a colony) ##
dist_to_point <- function(lat, long, poi.lat, poi.long){
  gc_distance(lat, long, poi.lat, poi.long)
}
