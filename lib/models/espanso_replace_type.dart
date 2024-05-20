abstract class EspansoReplaceType {
  static EspansoReplaceType get replace => EspansoReplaceTypeReplace();
  static EspansoReplaceType get markdown => EspansoReplaceTypeMarkdown();
  static EspansoReplaceType get html => EspansoReplaceTypeHtml();
  static EspansoReplaceType get form => EspansoReplaceTypeForm();
}

class EspansoReplaceTypeReplace extends EspansoReplaceType {
  @override
  String toString() => 'replace';
}

class EspansoReplaceTypeMarkdown extends EspansoReplaceType {
  @override
  String toString() => 'markdown';
}

class EspansoReplaceTypeHtml extends EspansoReplaceType {
  @override
  String toString() => 'html';
}

class EspansoReplaceTypeForm extends EspansoReplaceType {
  @override
  String toString() => 'form';
}

extension EspansoReplaceTypeExtension on EspansoReplaceType {
  bool get isReplace => this is EspansoReplaceTypeReplace;
  bool get isMarkdown => this is EspansoReplaceTypeMarkdown;
  bool get isHtml => this is EspansoReplaceTypeHtml;
  bool get isForm => this is EspansoReplaceTypeForm;
}
