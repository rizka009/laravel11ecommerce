<!DOCTYPE html>
<html>
<head>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1>Orders Report</h1>
    <table>
        <thead>
            <tr>
                <th class="text-center"  width="3%">No</th>
                <th>Name</th>
                {{-- <th>Phone</th> --}}
                <th>Subtotal</th>
                <th>Tax</th>
                <th>Total</th>
                <th>Status</th>
                <th>Order Date</th>
                <th>Total Items</th>
                <th>Delivered On</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($orders as $order)
                <tr>
                    <td>{{ $order->id }}</td>
                    <td>{{ $order->name }}</td>
                    {{-- <td>{{ $order->phone }}</td> --}}
                    <td>Rp. {{ $order->subtotal }}</td>
                    <td>Rp. {{ $order->tax }}</td>
                    <td>Rp. {{ $order->total }}</td>
                    <td>{{ ucfirst($order->status) }}</td>
                    <td>{{ $order->created_at }}</td>
                    <td>{{ $order->orderItems->count() }}</td>
                    <td>{{ $order->delivered_date }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>
