import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_model.dart';
import '../providers/products_provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routName = '/edit-product';
  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _discriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();

  // ignore: prefer_final_fields
  var _editedProudct = Product(
    id: DateTime.now().toString(),
    description: '',
    imageUrl: '',
    price: 0,
    title: '',
  );
  var _isInit = true;
  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _discriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  var _initValues = {
    'title': '',
    'discription': '',
    'price': '',
    'imageUrl': '',
  };

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);

    super.initState();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final proctId = ModalRoute.of(context)?.settings.arguments;
      if (proctId != null) {
        _editedProudct = Provider.of<Products>(context, listen: false)
            .findById(proctId.toString());
        _initValues = {
          'title': _editedProudct.title,
          'discription': _editedProudct.description,
          'price': _editedProudct.price.toString(),
          //'imageUrl': _editedProudct.imageUrl,
        };
        _imageUrlController.text = _editedProudct.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void saveForm(BuildContext context) {
    _form.currentState!.validate();
    _form.currentState!.save();

    Provider.of<Products>(context, listen: false).addProduct(_editedProudct);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        actions: [
          IconButton(
              onPressed: () => saveForm(context),
              icon: const Icon(Icons.save_alt))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _initValues['title'],
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (value) {
                  _editedProudct = Product(
                      id: _editedProudct.id,
                      title: value!,
                      description: _editedProudct.description,
                      imageUrl: _editedProudct.imageUrl,
                      price: _editedProudct.price);
                },
              ),
              TextFormField(
                initialValue: _initValues['price'],
                decoration: const InputDecoration(
                  labelText: 'Price',
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_discriptionFocusNode);
                },
                focusNode: _priceFocusNode,
                onSaved: (value) {
                  _editedProudct = Product(
                    id: _editedProudct.id,
                    title: _editedProudct.title,
                    description: _editedProudct.description,
                    imageUrl: _editedProudct.imageUrl,
                    price: double.parse(value!),
                  );
                },
              ),
              TextFormField(
                initialValue: _initValues['discription'],
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  labelText: 'Discription',
                ),
                maxLines: 3,
                focusNode: _discriptionFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_discriptionFocusNode);
                },
                onSaved: (value) {
                  _editedProudct = Product(
                    id: _editedProudct.id,
                    title: _editedProudct.title,
                    description: value!,
                    imageUrl: _editedProudct.imageUrl,
                    price: _editedProudct.price,
                  );
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(
                      top: 10,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: Container(
                      child: _imageUrlController.text.isEmpty
                          ? const Center(child: Text('Enter URL'))
                          : FittedBox(
                              child: Image.network(
                                _imageUrlController.text,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Image URL',
                      ),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageUrlController,
                      onEditingComplete: () {
                        setState(() {});
                      },
                      focusNode: _imageUrlFocusNode,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'U passed no image URL';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        _editedProudct = Product(
                          id: _editedProudct.id,
                          title: _editedProudct.title,
                          description: _editedProudct.description,
                          imageUrl: value!,
                          price: _editedProudct.price,
                        );
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
