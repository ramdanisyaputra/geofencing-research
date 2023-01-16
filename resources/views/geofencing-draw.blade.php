<html>
<head>
    <title>Google Maps Draw Polygon Get Coordinates</title>
</head>

<body >
    <h2>Google Maps Draw Polygon Get Coordinates</h2>
    <div id="map-canvas" style="height: 400px; width: 700px"></div>
    <h4>Updated Coordinates (X,Y)</h4>
    <form action="{{route('store')}}" method="POST">
        @csrf
        <label for="">Name</label>
        <input type="text" name="name" required>
        <br>
        <input type="hidden" name="coordinates" id="coordinates" required>
        <br>
        <button type="submit">Submit</button>
    </form>
    <div id="info" style="position:absolute; color:red; font-family: Arial; height:200px; font-size: 12px;"></div>

    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfma-9r9FYVPvxGPAR7ZQrNLdVE3Li4Fo&callback=initialize&libraries=drawing"></script> 
    <script>
        var mapOptions;
        var map;

        var bounds = new google.maps.LatLngBounds();

        var coordinates = []
        let new_coordinates = []
        let lastElement

        function InitMap() {
            var location = new google.maps.LatLng(-6.137381, 106.677267)
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
                map.fitBounds(bounds);
            }
                
            var markerCluster = new MarkerClusterer(map, locations, {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
            
            // Override our map zoom level once our fitBounds function runs (Make sure it only runs once)
            var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
                this.setZoom(10);
                google.maps.event.removeListener(boundsListener);
            });

            var all_overlays = [];
            var selectedShape;
            var drawingManager = new google.maps.drawing.DrawingManager({
                //drawingMode: google.maps.drawing.OverlayType.MARKER,
                drawingControl: true,
                drawingControlOptions: {
                    position: google.maps.ControlPosition.TOP_CENTER,
                    drawingModes: [
                        google.maps.drawing.OverlayType.POLYGON,
                    ]
                },
                polygonOptions: {
                    clickable: true,
                    draggable: false,
                    editable: true,
                    // fillColor: '#ffff00',
                    fillColor: '#ADFF2F',
                    fillOpacity: 0.5,

                },
            });

            function clearSelection() {
                if (selectedShape) {
                    selectedShape.setEditable(false);
                    selectedShape = null;
                }
            }
            //to disable drawing tools
            function stopDrawing() {
                drawingManager.setMap(null);
            }

            function setSelection(shape) {
                clearSelection();
                stopDrawing()
                selectedShape = shape;
                shape.setEditable(true);
            }

            function deleteSelectedShape() {
                if (selectedShape) {
                    selectedShape.setMap(null);
                    drawingManager.setMap(map);
                    coordinates.splice(0, coordinates.length)
                    document.getElementById('info').innerHTML = "";
                    document.getElementById('coordinates').value = "";
                }
            }

            function CenterControl(controlDiv, map) {

                // Set CSS for the control border.
                var controlUI = document.createElement('div');
                controlUI.style.backgroundColor = '#fff';
                controlUI.style.border = '2px solid #fff';
                controlUI.style.borderRadius = '3px';
                controlUI.style.boxShadow = '0 2px 6px rgba(0,0,0,.3)';
                controlUI.style.cursor = 'pointer';
                controlUI.style.marginBottom = '22px';
                controlUI.style.textAlign = 'center';
                controlUI.title = 'Select to delete the shape';
                controlDiv.appendChild(controlUI);

                // Set CSS for the control interior.
                var controlText = document.createElement('div');
                controlText.style.color = 'rgb(25,25,25)';
                controlText.style.fontFamily = 'Roboto,Arial,sans-serif';
                controlText.style.fontSize = '16px';
                controlText.style.lineHeight = '38px';
                controlText.style.paddingLeft = '5px';
                controlText.style.paddingRight = '5px';
                controlText.innerHTML = 'Delete Selected Area';
                controlUI.appendChild(controlText);

                //to delete the polygon
                controlUI.addEventListener('click', function () {
                    deleteSelectedShape();
                });
            }

            drawingManager.setMap(map);

            var getPolygonCoords = function (newShape) {

                coordinates.splice(0, coordinates.length)

                var len = newShape.getPath().getLength();

                for (var i = 0; i < len; i++) {
                    // coordinates.push(newShape.getPath().getAt(i).toUrlValue(6))
                    coordinates.push({lat: newShape.getPath().getAt(i).lat(), lng: newShape.getPath().getAt(i).lng()});
                }
                var json = JSON.stringify(coordinates)
                // document.getElementById('info').innerHTML = json;
                document.getElementById('coordinates').value = json;
            }

            google.maps.event.addListener(drawingManager, 'polygoncomplete', function (event) {
                event.getPath().getLength();
                google.maps.event.addListener(event, "dragend", getPolygonCoords(event));

                google.maps.event.addListener(event.getPath(), 'insert_at', function () {
                    getPolygonCoords(event)
                    
                });

                google.maps.event.addListener(event.getPath(), 'set_at', function () {
                    getPolygonCoords(event)
                })
            })

            google.maps.event.addListener(drawingManager, 'overlaycomplete', function (event) {
                all_overlays.push(event);
                if (event.type !== google.maps.drawing.OverlayType.MARKER) {
                    drawingManager.setDrawingMode(null);

                    var newShape = event.overlay;
                    newShape.type = event.type;
                    google.maps.event.addListener(newShape, 'click', function () {
                        setSelection(newShape);
                    });
                    setSelection(newShape);
                }
            })

            var centerControlDiv = document.createElement('div');
            var centerControl = new CenterControl(centerControlDiv, map);

            
            centerControlDiv.index = 1;
            map.controls[google.maps.ControlPosition.BOTTOM_CENTER].push(centerControlDiv);

        }

        InitMap()

    </script>

</body>
</html>

