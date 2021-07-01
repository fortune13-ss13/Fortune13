/**
 * Returns the euclidean distance between two objects.
 * 
 * Only works for turfs and things whose loc is a turf, this needs to be checked for proper results.
 * Things inside backpacks and other containers can have their x and y values set to zero.
 * 
 * This is useful because get_dist() makes no differentiation between cardinal and diagonal moves, but this one does.
 * A major difference is that this will result in rational numbers, while get_dist() will only produce integers.
 */
#define GET_DIST_EUCLIDEAN(source, target) ( sqrt(((source.x-target.x)**2) + ((source.y-target.y)**2)) )
