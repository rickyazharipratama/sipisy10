abstract class PageState{

  int? activePage = 0;
  PageState({this.activePage});
}

class InitializingPage extends PageState{
  InitializingPage({required super.activePage});
}

class PageChanged extends PageState{

   PageChanged({required int active}){
    super.activePage = active;
   }
}

