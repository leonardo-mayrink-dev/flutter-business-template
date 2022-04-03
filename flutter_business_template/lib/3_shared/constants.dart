import 'package:flutter/material.dart';

// Propriedades
const kDefaultPadding = 20.0;

// Cores
const kBackgroundColor = Color(0xFFFFFFFF);
const kPrimaryColor = Color(0xFFFFC61F);
const kTextColor = Color(0xFF757575);
const kTitleTextColor = Color(0xFF000000);
const kIconThemeColor = Color(0xFF000000);
const kTextThemeHeadLine6Color = Color(0XFF8B8B8B);
const kDefaultButtonTextColor = Color(0xFFFFFFFF);
const kAppBarThemeColor = Color(0xFFFFFFFF);
const kSocialMediaColor = Color(0xFFF5F6F9);
const kSecondaryColor = Color(0xFFB5BFD0);
const kTextLightColor = Color(0xFFACACAC);

// FireStore - Nome das Coleções
const String kColecaoUsuarios = "usuarios";

// Formulário - Erros
final RegExp kNameValidatorRegExp =
    RegExp(r"^[A-zÀ-ú '´,.\-]+$", unicode: true);
const String kEmailNullError = "Por favor, insira o seu e-mail";
const String kInvalidEmailError = "Por favor, insira um e-mail válido";
const String kPassNullError = "Por favor, insira a sua senha";
const String kShortPassError = "A senha é muito curta";
const String kMatchPassError = "As senhas não coincidem";
const String kNamelNullError = "Por favor, insira seu nome";
const String kPhoneNumberNullError = "Por favor, insira o seu telefone";
const String kAddressNullError = "Por favor, insira o seu endereço";
const String kNameNullError = "Por favor, insira o seu nome";
const String kInvalidNameError = "Por favor, insira um nome válido";
const String kPostcodeNullError = "Por favor, insira o seu CEP";
const String kInvalidPostcodeError = "Por favor, insira um CEP válido";
const String kStreetNullError = "Por favor, insira o seu logradouro";
const String kInvalidStreetError = "Por favor, insira um logradouro válido";
const String kHouseNumberNullError = "Por favor, insira o número da residência";
const String kCityNullError = "Por favor, insira a sua cidade";
const String kInvalidCityError = "Por favor, insira uma cidade válida";
const String kNeighborhoodNullError = "Por favor, insira o seu bairro";
const String kInvalidNeighborhoodError = "Por favor, insira um bairro válido";

// Mensagens
const String kMsgEmailRecuperacaoEnviado =
    "E-mail de redefinição de senha enviado com sucesso!";
const String kMsgUsuarioCriado = "Usuário criado com sucesso!";
const String kMsgUsuarioAutenticado = "Usuário autenticado com sucesso!";
const String kMsgErroInesperado = "Ocorreu algum erro inesperado.";
const String kMsgErroLoginFacebook =
    "Não foi possível realizar a autenticação via Facebook.";
const String kMsgUsuarioAtualizado = "Atualização realizada com sucesso!";

// Chaves - Shared Preferences
const String kRememberMe = "KEY_REMEMBER_ME";

// URIs
const String kFacebookProfile =
    "https://graph.facebook.com/v2.12/me?fields=name,email&access_token=";
