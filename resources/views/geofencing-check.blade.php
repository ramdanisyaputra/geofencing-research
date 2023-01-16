<html>
<head>
    <title>Google Maps Draw Polygon Get Coordinates</title>
</head>

<body>
    <h2>Google Maps Check Inside / Outside</h2>
    <div id="map-canvas" style="height: 400px; width: 700px"></div>
    <h4>Put lat and long, click submit for result inside/outside</h4>
    <form action="{{route('check.post')}}" method="POST">
        @csrf
        <label for="">lat</label>
        <input type="text" name="lat">
        <br>
        <label for="">long</label>
        <input type="text" name="long">
        <input type="hidden" name="id" value="{{$geofence->id}}">
        <button type="submit">Submit</button>
    </form>
    <div id="info" style="position:absolute; color:red; font-family: Arial; height:200px; font-size: 12px;"></div>
    @php
        $coordinates = json_decode($geofence->coordinates);
    @endphp
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfma-9r9FYVPvxGPAR7ZQrNLdVE3Li4Fo&callback=initialize"></script> 
    <script>
        var mapOptions;
        var map;
        var bounds = new google.maps.LatLngBounds();
        var coordinates = []
        let new_coordinates = []
        
        function InitMap() {
            var location = new google.maps.LatLng(<?php echo $coordinates[0]->lat ?>, <?php echo $coordinates[0]->lng ?>)
            mapOptions = {
                zoom: 12,
                center: location,
                mapTypeId: google.maps.MapTypeId.RoadMap
            }
            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions)
            var markers = [
                <?php foreach ($outlets as $row) { ?>
                    ['<?php echo str_replace("'", "", $row->name);?>', <?php echo $row->lat;?>, <?php echo $row->long;?>, '<?php echo $row->pinpointUrl;?>'],
                <?php }?>
            ];
            var infoWindowContent = [
                <?php foreach ($outlets as $row) { ?>  
                    ['<div class="info_content">' +
                    '<table width="100%"><tr>' +
                    '<td style="vertical-align:top;"><img src="{{ $row->imageUrl }}" style="width:100px !important; height:100px; object-fit:cover; margin-top:6px; margin-right:15px;"></td>' +
                    '<td><h5><?php echo str_replace("'", "", $row->name);?></h5>' +
                    '<p><?php echo trim(preg_replace('/\s+/', ' ', str_replace("'", "", $row->address)));?></p>' +        
                    '</tr></table>' +
                    '</div>'],
                <?php }?>
            ];
            
            var latlanglist = [];
            var locations = [];
            var infoWindow = new google.maps.InfoWindow({content: "Loading..."});
            // Loop through our array of markers & place each one on the map  
            for( i = 0; i < markers.length; i++ ) {
                latlanglist.push(position = new google.maps.LatLng(markers[i][1], markers[i][2]));
                var image = {
                    url: markers[i][3],
                    scaledSize: new google.maps.Size(40, 40)
                };
                bounds.extend(position);
                locations.push(marker = new google.maps.Marker({
                    position: position,
                    map: map,
                    title: markers[i][0],
                    icon : image
                }));
                
                // Allow each marker to have an info window    
                google.maps.event.addListener(marker, 'click', (function(marker, i) {
                    return function() {
                        infoWindow.setContent(infoWindowContent[i][0]);
                        infoWindow.open(map, marker);
                    }
                })(marker, i));

                // Automatically center the map fitting all markers on the screen
            }
                
            var markerCluster = new MarkerClusterer(map, locations, {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
            
            // Override our map zoom level once our fitBounds function runs (Make sure it only runs once)
            var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
                this.setZoom(10);
                google.maps.event.removeListener(boundsListener);
            });

            const triangleCoords = <?php echo $geofence->coordinates ?>;
            // Construct the polygon.
            const polyMap = new google.maps.Polygon({
                paths: triangleCoords,
                strokeColor: "#FF0000",
                strokeOpacity: 0.8,
                strokeWeight: 2,
                fillColor: "#FF0000",
                fillOpacity: 0.35,
                editable: true,
            });

            polyMap.setMap(map);

            polyMap.getPath().addListener('set_at', function() {
                updateCoordinates();
            });

            polyMap.getPath().addListener('insert_at', function() {
                updateCoordinates();
            });

            function updateCoordinates() {
                coordinates = []
                polyMap.getPath().forEach(function(latLng) {
                    coordinates.push({lat: latLng.lat(), lng: latLng.lng()});
                });
                // console.log(coordinates) atau proses lain yang ingin dilakukan dengan koordinat
                var json = JSON.stringify(coordinates)
                // document.getElementById('info').innerHTML = json;
                document.getElementById('coordinates').value = json;
            }

        }

        InitMap()

    </script>

</body>
</html>

