import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({
    Key? key,
  }) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final _phoneNode = FocusNode();
  final _passNode = FocusNode();
  final _cnicNode = FocusNode();
  var _validRegX = false;

  @override
  void initState() {
    _formKey.currentState?.validate();
    super.initState();
  }

  @override
  void dispose() {
    _phoneNode.dispose();
    _passNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.30,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  _validRegX ? "Valid RegX" : "Invalid RegX",
                  style: const TextStyle(fontSize: 25),
                ),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: "something@something.com",
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onFieldSubmitted: ((value) {
                FocusScope.of(context).requestFocus(_phoneNode);
                setState(() {});
              }),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please provide value";
                }
                const regX = r"^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$";
                final checkRegX = RegExp(regX);
                if (!checkRegX.hasMatch(value)) {
                  _validRegX = false;
                  return "Please provide correct email pattern";
                }
                _validRegX = true;
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Phone',
                hintText: '+923000000000',
              ),
              focusNode: _phoneNode,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_cnicNode);
                setState(() {});
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please provide a number";
                }

                const pattern = r"^[+][9][2][3][0-9]{9}$";
                final regX = RegExp(pattern);
                if (!regX.hasMatch(value)) {
                  _validRegX = false;
                  return "Please enter valid number";
                }
                _validRegX = true;
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'CNIC',
                hintText: '11111-1111111-1',
              ),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(_passNode);
                setState(() {});
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Give correct CNIC format";
                }

                const pattern = r"^[0-9]{5}[-][0-9]{7}[-][0-9]$";
                final regX = RegExp(pattern);
                if (!regX.hasMatch(value)) {
                  _validRegX = false;
                  return "Please enter valid number";
                }
                _validRegX = true;
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              focusNode: _passNode,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Kindly provide us with your password';
                }
                _validRegX = true;
                return null;
              },
              onFieldSubmitted: (value) {
                if (_validRegX && value.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Form Submitted'),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Kindly validate the form'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
