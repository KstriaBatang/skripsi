import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app2/modules/search-by-name/components/ListBank.dart';
import 'package:flutter_app2/modules/search-by-name/Detail.dart';
import 'package:flutter_app2/providers/bank.dart';
import 'package:flutter_app2/providers/auth.dart';

class FormSearchByName extends StatefulWidget {
  @override
  _FormSearchByNameState createState() => _FormSearchByNameState();
}

class _FormSearchByNameState extends State<FormSearchByName> {
  final GlobalKey<FormBuilderState> globalFormKey = new GlobalKey<FormBuilderState>();
  final TextEditingController nameController = TextEditingController();

  bool _isLoading = true;
  String _token;

  @override
  void initState() {
    super.initState();
    _token = Provider.of<AuthProvider>(context, listen: false).user.token;
    Provider.of<BankProvider>(context, listen: false).getList(token: _token).then(
          (_) => setState(() => _isLoading = false),
        );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bankData = Provider.of<BankProvider>(context);
    final _list = bankData.list;

    return ChangeNotifierProvider(
      create: (_) => BankProvider(),
      child: Container(
        margin: EdgeInsets.only(top: size.height * .08),
        child: FormBuilder(
          key: globalFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Masukkan Nama Bank :',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              SizedBox(height: 5),
              FormBuilderTextField(
                name: 'nama bank',
                textInputAction: TextInputAction.search,
                controller: nameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black26,
                      width: 1.0,
                    ),
                  ),
                ),
                onSubmitted: (value) => doSearch(value),
              ),
              SizedBox(height: 15),
              _isLoading
                  ? Container(
                      height: MediaQuery.of(context).size.height * .5,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Sedang mengambil data...')
                          ],
                        ),
                      ),
                    )
                  : Container(
                      height: size.height * .5,
                      color: Colors.transparent,
                      child: ListView.builder(
                        itemCount: _list.length,
                        itemBuilder: (ctx, i) {
                          return ListBank(
                            bankName: _list[i].nama,
                            pict: _list[i].pic,
                            press: () {
                              Navigator.push(context, MaterialPageRoute(builder: (ctx) => DetailBankPage(_list[i])));
                            },
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void doSearch(String search) {
    setState(() => _isLoading = true);

    Provider.of<BankProvider>(context, listen: false)
        .getList(token: 'asda', search: search)
        .then((_) => setState(() => _isLoading = false));
  }
}
