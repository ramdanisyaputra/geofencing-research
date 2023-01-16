<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Geofencing</title>
</head>
<body>
    <div class="container">
        <h3 class="mt-4 mb-2">List Geofencing</h3>
        <a href="{{route('create')}}" class="btn btn-success mb-3">Add New Data</a>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Coordinates Array</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($geofences as $row)
                    @php
                        $coordinates = json_decode($row->coordinates);
                    @endphp
                    <tr>
                        <td>{{$row->name}}</td>
                        <td>
                            @foreach($coordinates as $c)
                                Lat: {{$c->lat}}, Long: {{$c->lng}}
                                <br>
                            @endforeach
                        </td>
                        <td>
                            <a href="{{route('edit', $row->id)}}" class="btn btn-primary btn-sm">Edit</a>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>