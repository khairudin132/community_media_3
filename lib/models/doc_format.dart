class DocFormat {
  icon(String docFormat) {
    switch (docFormat) {
      case 'pdf':
        return 'assets/icons/pdf.png';
        break;
      case 'ppt':
        return 'assets/icons/powerpoint.png';
        break;
      case 'doc':
        return 'assets/icons/word.png';
        break;
      case 'xlsx':
        return 'assets/icons/excel.png';
        break;
      case 'no file':
        return 'assets/icons/excel.png';
        break;
      default:
        break;
    }
  }
}
