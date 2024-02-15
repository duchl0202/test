import 'package:flutter/material.dart';

class CustomDataTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Column 1')),
          DataColumn(label: Text('Column 2')),
          DataColumn(label: Text('Column 3')),
        ],
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Cell 1')),
              DataCell(Text('Cell 2')),
              DataCell(Text('Cell 3')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Cell 4')),
              DataCell(Text('Cell 5')),
              DataCell(Text('Cell 6')),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Custom DataTable')),
      body: Center(child: CustomDataTable()),
    ),
  ));
}
