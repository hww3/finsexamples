inherit Fins.FinsController;

public void index(Fins.Request id, Fins.Response response, mixed ... args)
{
  object t = view->get_view("index");
  response->set_view(t);  
} 

public void search(Fins.Request id, Fins.Response response, mixed ... args)
{
  object c = Public.Image.SmugMug.client("1A2WfVFFiGMCY4O8ZljStYHzJ66fiI0M");

  array r = c->search(id->variables->keywords);

  if(sizeof(r) > 25) r = r[0..24];

  object t = view->get_view("_image");

  t->add("images", r);

  response->set_view(t);
}
