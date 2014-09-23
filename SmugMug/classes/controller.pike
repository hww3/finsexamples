inherit Fins.FinsController;
inherit Fins.RootController;

static void create(object app)
{
  ::create(app);
}

void index(Fins.Request id, Fins.Response response, mixed ... args)
{
  object t = view->get_view("index");
  response->set_view(t);  
} 

void search(Fins.Request id, Fins.Response response, mixed ... args)
{
  array r = runSearch(id->variables->keywords);

  if(sizeof(r) > 25) r = r[0..24];

  object t = view->get_view("_image");

  t->add("images", r);

  response->set_view(t);
}

private array runSearch(string keywords)
{
  string url = "http://api.smugmug.com/hack/feed.mg?Type=openSearchKeyword&Data=%s&format=rss200";
  string data = Protocols.HTTP.get_url_data(sprintf(url, keywords));

  object channel = Public.Syndication.RSS.parse(data);

  array results = ({});

  foreach(channel->items;; object item)
  {
    results += ({(["link":item->data->link, "thumbnail":item->data->guid[0] ])});

  }
  return results;
}
