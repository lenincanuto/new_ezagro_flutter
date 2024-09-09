class AppStrings {
  AppStrings._();

  static const String appTitle = 'Ez Agro';

  static const String cpfString = 'Cpf';
  static const String passwordString = 'Senha';
  static const String forgotPasswordString = 'Esqueci minha senha';
  static const String firstAccessString = 'Primeiro Acesso';
  static const String enterString = 'Entrar';
  static const String firstTypeYourCpfString = 'Primeiro digite seu CPF';
  static const String forwardString = 'Avançar';
  static const String backString = 'Voltar';
  static const String weSentTheConfirmationCodeToYourPhone = 'Enviamos em seu telefone\num código de confirmação de seu\ncadastro';
  static const String typeTheNumberBellow = 'Digite o número abaixo:';
  static const String nowTypeNewPassword = 'Agora, digite sua nova\nsenha:';
  static const String retypeYourPassword = 'Repita sua senha:';
  static const String iHaveReadAndAgreeToThe = 'Li e concordo com a ';
  static const String privacySpacingPolicy = 'Política de\nPrivacidade';
  static const String privacyPolicy = 'Política de Privacidade';
  static const String and = ' e ';
  static const String userTerms = 'Termos do Usuário';

  static const String loremIpsum = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  static const String forgotPasswordFirstStep = 'Esqueceu sua senha?\nDigite seu CPF e vamos enviar uma senha provisória em seu telefone:';

  ///Service Order Module
  //Service Order List Strings
  static const String serviceOrderTitle = "Ordem de Serviço";
  static const String costCenterCardField = "Centro de Custo: ";
  static const String openingDateCardField = "Abertura: ";
  static const String closingDateCardField = "Conclusão: ";
  static const String searchBarHint = 'Pesquisar';
  static const String dateNotInformed = "Não informado";

  //Service Order Type Enum Strings
  static const String toBeStartedSOEnum = "A iniciar";
  static const String onGoingSOEnum = "Em andamento";
  static const String pausedSOEnum = "Pausada";
  static const String finishedOSEnum = "Finalizada";
  static const String approvalPendingOSEnum = "Aguardando aprovação";
  static const String approvalPendingOSWithLineBreakEnum = "Aguardando\naprovação";
  static const String canceledOSEnum = "Cancelada";

  //Service Order Details
  static const String finishedServiceOrder = "Essa Ordem de Serviço\nfoi finalizada";
  static const String saveOSButton = "Salvar";
  static const String suspendOSButton = "Suspender";
  static const String cancelOSButton = "Cancelar";
  static const String finishedOSButton = "Finalizar";
  static const String resumeOSButton = "Retomar";

  //Create Service Order
  static const String previousButton = "Anterior";
  static const String nextButton = "Próximo";
  static const String activitySelector = "Atividade:";
  static const String costCenterSelector = "Centro de Custo";
  static const String farmSelector = "Fazenda:";
  static const String harvestSelector = "Safra";
  static const String executionerSelector = "Executores:";
  static const String machinerySelector = "Maquinário:";
  static const String productSelector = "Produto:";

  ///Errors
  static const String genericErrorMessage =
      'Ocorreu um erro inesperado. Por favor, tente novamente mais tarde ou entre em contato conosco para relatar o problema.';
  static const String serverErrorMessage =
      'Ocorreu um erro no processamento da sua requisição. Por favor, tente novamente mais tarde ou entre em contato conosco para relatar o problema.';
  static const String serverErrorCausedBy =
      'Erro ao fazer a chamada de um serviço na API.';
  static const String reautenticationNeededErrorMessage =
      'Erro ao efetuar o Login.\nPor favor, verifique os dados digitados e repita a operação.';
  static const String unauthenticatedUserErrorCausedBy =
      'Usuário não autenticado.';

  ///Shared Preferences keys
  static const String tokenKey = 'Token';
  static const String idKey = 'id';
  static const String directoryKey = 'Directory';
}
