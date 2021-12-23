import 'package:flutter/material.dart';

class SearchDeaButton extends StatelessWidget {
  const SearchDeaButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 8.0,
          primary: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () {},
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            'BUSCAR DEA',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
