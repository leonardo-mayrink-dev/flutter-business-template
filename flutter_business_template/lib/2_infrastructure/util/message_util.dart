import 'dart:collection';

import 'package:flutter_business_template/3_shared/constants.dart';

class MessageUtil {
  static final MessageUtil _singleton = MessageUtil._internal();
  factory MessageUtil() {
    return _singleton;
  }
  MessageUtil._internal();

  static Queue<String> _messages = Queue<String>();

  static String getLastMessage() {
    String message = "";
    if (_messages.isNotEmpty) {
      message = _messages.last;
      _messages.clear();
    }
    return message;
  }

  static void addMessage(String message) {
    _messages.clear();
    _messages.addLast(message);
  }

  /// Adiciona na fila uma mensagem correspondente ao [erro] passado por parâmetro.
  ///
  /// Em caso de status desconhecido, adiciona uma mensagem padrão de erro
  /// inesperado: "Ocorreu algum erro inesperado".
  static void addErrorMessage(String erro) {
    switch (erro) {
      case 'app-deleted':
        addMessage('O banco de dados não foi localizado.');
        break;
      case 'expired-action-code':
        addMessage('O código da ação o ou link expirou.');
        break;
      case 'invalid-action-code':
        addMessage(
            'O código da ação é inválido. Isso pode acontecer se o código estiver malformado ou já tiver sido usado.');
        break;
      case 'user-disabled':
        addMessage(
            'O usuário correspondente à credencial fornecida foi desativado.');
        break;
      case 'user-not-found':
        addMessage('O usuário não correponde à nenhuma credencial.');
        break;
      case 'weak-password':
        addMessage('A senha é muito fraca.');
        break;
      case 'email-already-in-use':
        addMessage('Já existe uma conta com o endereço de email fornecido.');
        break;
      case 'invalid-email':
        addMessage('O endereço de e-mail não é válido.');
        break;
      case 'operation-not-allowed':
        addMessage(
            'O tipo de conta correspondente à esta credencial, ainda não encontra-se ativada.');
        break;
      case 'account-exists-with-different-credential':
        addMessage('E-mail já associado a outra conta.');
        break;
      case 'auth-domain-config-required':
        addMessage('A configuração para autenticação não foi fornecida.');
        break;
      case 'credential-already-in-use':
        addMessage('Já existe uma conta para esta credencial.');
        break;
      case 'operation-not-supported-in-this-environment':
        addMessage(
            'Esta operação não é suportada no ambiente que está sendo executada. Verifique se deve ser http ou https.');
        break;
      case 'timeout':
        addMessage(
            'Excedido o tempo de resposta. O domínio pode não estar autorizado para realizar operações.');
        break;
      case 'missing-android-pkg-name':
        addMessage(
            'Deve ser fornecido um nome de pacote para instalação do aplicativo Android.');
        break;
      case 'missing-continue-uri':
        addMessage('A próxima URL deve ser fornecida na solicitação.');
        break;
      case 'missing-ios-bundle-id':
        addMessage(
            'Deve ser fornecido um nome de pacote para instalação do aplicativo iOS.');
        break;
      case 'invalid-continue-uri':
        addMessage('A próxima URL fornecida na solicitação é inválida.');
        break;
      case 'unauthorized-continue-uri':
        addMessage(
            'O domínio da próxima URL não está na lista de autorizações.');
        break;
      case 'invalid-dynamic-link-domain':
        addMessage(
            'O domínio de link dinâmico fornecido, não está autorizado ou configurado no projeto atual.');
        break;
      case 'argument-error':
        addMessage('Verifique a configuração de link para o aplicativo.');
        break;
      case 'invalid-persistence-type':
        addMessage(
            'O tipo especificado para a persistência dos dados é inválido.');
        break;
      case 'unsupported-persistence-type':
        addMessage(
            'O ambiente atual não suportar o tipo especificado para persistência dos dados.');
        break;
      case 'invalid-credential':
        addMessage('A credencial expirou ou está mal formada.');
        break;
      case 'wrong-password':
        addMessage('Senha incorreta.');
        break;
      case 'invalid-verification-code':
        addMessage('O código de verificação da credencial não é válido.');
        break;
      case 'invalid-verification-id':
        addMessage('O ID de verificação da credencial não é válido.');
        break;
      case 'custom-token-mismatch':
        addMessage('O token está diferente do padrão solicitado.');
        break;
      case 'invalid-custom-token':
        addMessage('O token fornecido não é válido.');
        break;
      case 'captcha-check-failed':
        addMessage(
            'O token de resposta do reCAPTCHA não é válido, expirou ou o domínio não é permitido.');
        break;
      case 'invalid-phone-number':
        addMessage(
            'O número de telefone está em um formato inválido (padrão E.164).');
        break;
      case 'missing-phone-number':
        addMessage('O número de telefone é requerido.');
        break;
      case 'quota-exceeded':
        addMessage('A cota de SMS foi excedida.');
        break;
      case 'cancelled-popup-request':
        addMessage(
            'Somente uma solicitação de janela pop-up é permitida de uma só vez.');
        break;
      case 'popup-blocked':
        addMessage('A janela pop-up foi bloqueado pelo navegador.');
        break;
      case 'popup-closed-by-user':
        addMessage(
            'A janela pop-up foi fechada pelo usuário sem concluir o login no provedor.');
        break;
      case 'unauthorized-domain':
        addMessage(
            'O domínio do aplicativo não está autorizado para realizar operações.');
        break;
      case 'invalid-user-token':
        addMessage('O usuário atual não foi identificado.');
        break;
      case 'user-token-expired':
        addMessage('O token do usuário atual expirou.');
        break;
      case 'null-user':
        addMessage('O usuário atual é nulo.');
        break;
      case 'app-not-authorized':
        addMessage(
            'Aplicação não autorizada para autenticar com a chave informada.');
        break;
      case 'invalid-api-key':
        addMessage('A chave da API fornecida é inválida.');
        break;
      case 'network-request-failed':
        addMessage('Falha de conexão com a rede.');
        break;
      case 'requires-recent-login':
        addMessage(
            'O último horário de acesso do usuário não atende ao limite de segurança.');
        break;
      case 'too-many-requests':
        addMessage(
            'As solicitações foram bloqueadas devido a atividades incomuns. Tente novamente depois que algum tempo.');
        break;
      case 'web-storage-unsupported':
        addMessage(
            'O navegador não suporta armazenamento ou se o usuário desativou este recurso.');
        break;
      case 'invalid-claims':
        addMessage('Os atributos de cadastro personalizado são inválidos.');
        break;
      case 'claims-too-large':
        addMessage(
            'O tamanho da requisição excede o tamanho máximo permitido de 1 Megabyte.');
        break;
      case 'id-token-expired':
        addMessage('O token informado expirou.');
        break;
      case 'id-token-revoked':
        addMessage('O token informado perdeu a validade.');
        break;
      case 'invalid-argument':
        addMessage('Um argumento inválido foi fornecido a um método.');
        break;
      case 'invalid-creation-time':
        addMessage('O horário da criação precisa ser uma data UTC válida.');
        break;
      case 'invalid-disabled-field':
        addMessage('A propriedade para usuário desabilitado é inválida.');
        break;
      case 'invalid-display-name':
        addMessage('O nome do usuário é inválido.');
        break;
      case 'invalid-hash-algorithm':
        addMessage('O algoritmo de HASH não é uma criptografia compatível.');
        break;
      case 'invalid-hash-block-size':
        addMessage('O tamanho do bloco de HASH não é válido.');
        break;
      case 'invalid-hash-derived-key-length':
        addMessage('O tamanho da chave derivada do HASH não é válido.');
        break;
      case 'invalid-hash-key':
        addMessage('A chave de HASH precisa ter um buffer de byte válido.');
        break;
      case 'invalid-hash-memory-cost':
        addMessage('O custo da memória HASH não é válido.');
        break;
      case 'invalid-hash-parallelization':
        addMessage('O carregamento em paralelo do HASH não é válido.');
        break;
      case 'invalid-hash-rounds':
        addMessage('O arredondamento de HASH não é válido.');
        break;
      case 'invalid-hash-salt-separator':
        addMessage(
            'O campo do separador de SALT do algoritmo de geração de HASH precisa ser um buffer de byte válido.');
        break;
      case 'invalid-id-token':
        addMessage('O código do token informado não é válido.');
        break;
      case 'invalid-last-sign-in-time':
        addMessage(
            'O último horário de login precisa ser uma data UTC válida.');
        break;
      case 'invalid-page-token':
        addMessage('A próxima URL fornecida na solicitação é inválida.');
        break;
      case 'invalid-password':
        addMessage('A senha é inválida, precisa ter pelo menos 6 caracteres.');
        break;
      case 'invalid-password-hash':
        addMessage('O HASH da senha não é válida.');
        break;
      case 'invalid-password-salt':
        addMessage('O SALT da senha não é válido.');
        break;
      case 'invalid-photo-url':
        addMessage('A URL da foto de usuário é inválido.');
        break;
      case 'invalid-provider-id':
        addMessage('O identificador de provedor não é compatível.');
        break;
      case 'invalid-session-cookie-duration':
        addMessage(
            'A duração do COOKIE da sessão precisa ser um número válido em milissegundos, entre 5 minutos e 2 semanas.');
        break;
      case 'invalid-uid':
        addMessage(
            'O identificador fornecido deve ter no máximo 128 caracteres.');
        break;
      case 'invalid-user-import':
        addMessage('O registro do usuário a ser importado não é válido.');
        break;
      case 'invalid-provider-data':
        addMessage('O provedor de dados não é válido.');
        break;
      case 'maximum-user-count-exceeded':
        addMessage(
            'O número máximo permitido de usuários a serem importados foi excedido.');
        break;
      case 'missing-hash-algorithm':
        addMessage(
            'É necessário fornecer o algoritmo de geração de HASH e seus parâmetros para importar usuários.');
        break;
      case 'missing-uid':
        addMessage('Um identificador é necessário para a operação atual.');
        break;
      case 'reserved-claims':
        addMessage(
            'Uma ou mais propriedades personalizadas fornecidas usaram palavras reservadas.');
        break;
      case 'session-cookie-revoked':
        addMessage('O COOKIE da sessão perdeu a validade.');
        break;
      case 'uid-alread-exists':
        addMessage('O indentificador fornecido já está em uso.');
        break;
      case 'email-already-exists':
        addMessage('O e-mail fornecido já está em uso.');
        break;
      case 'phone-number-already-exists':
        addMessage('O telefone fornecido já está em uso.');
        break;
      case 'project-not-found':
        addMessage('Nenhum projeto foi encontrado.');
        break;
      case 'insufficient-permission':
        addMessage(
            'A credencial utilizada não tem permissão para acessar o recurso solicitado.');
        break;
      case 'internal-error':
        addMessage(
            'O servidor de autenticação encontrou um erro inesperado ao tentar processar a solicitação.');
        break;
      default:
        addMessage(kMsgErroInesperado);
        break;
    }
  }
}
