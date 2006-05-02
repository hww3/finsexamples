import Fins;
inherit Fins.FinsController;

public void index(Request id, Response response, mixed args) {
  object v = view->get_view("helloworld");
  v->add("Request", sprintf("%O", mkmapping(indices(id), values(id))));
  response->set_view(v);
}
