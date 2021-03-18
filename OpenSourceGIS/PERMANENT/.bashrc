test -r ~/.alias && . ~/.alias
PS1='GRASS 7.8.5 (OpenSourceGIS):\w > '
grass_prompt() {
    MAPSET_PATH="`g.gisenv get=GISDBASE,LOCATION_NAME,MAPSET separator='/'`"
    LOCATION="$MAPSET_PATH"
    
    if test -f "$MAPSET_PATH/cell/MASK" && test -d "$MAPSET_PATH/grid3/RASTER3D_MASK" ; then
        echo "[2D and 3D raster MASKs present]"
    elif test -f "$MAPSET_PATH/cell/MASK" ; then
        echo "[Raster MASK present]"
    elif test -d "$MAPSET_PATH/grid3/RASTER3D_MASK" ; then
        echo "[3D raster MASK present]"
    fi
}
PROMPT_COMMAND=grass_prompt
export HOME="/Users/alitzelxiadani"
export PATH="/Applications/GRASS-7.8.app/Contents/Resources/bin:/Applications/GRASS-7.8.app/Contents/Resources/scripts:/Users/alitzelxiadani/Library/GRASS/7.8/Modules/bin:/Users/alitzelxiadani/Library/GRASS/7.8/Modules/scripts:/usr/bin:/bin:/usr/sbin:/etc:/usr/lib"
trap "exit" TERM
