inherit Fins.Application;

void start()
{
#if !constant(Public.Parser.XML2)
throw(Error.Generic("Public.Parser.XML2 must be installed to run this application!\n"));
#endif
}
