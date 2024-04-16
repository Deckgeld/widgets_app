import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  //Nos ayudara a invocar las imagenes y a saber cuando cargar la siguiente pagina
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  //Nos ayudara a saber si se esta cargando la siguiente pagina
  bool isLoading = false;
  //Nos ayudara a saber si el widget esta montado
  bool isMounted = true;

  //Se ejecuta cuando el widget es montado
  @override
  void initState() {
    scrollController.addListener(() {
      //Si el scroll esta a 500 pixeles de llegar al final de la pagina, cargamos la siguiente pagina
      if ((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
    super.initState();
  }

  //Se ejecuta cuando el widget es desmontado
  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  //funcion para cargar la siguiente pagina
  Future loadNextPage() async {
    //Si ya se esta cargando la siguiente pagina, no hacemos nada, esta validacion es para evitar que se hagan multiples peticiones
    //ya que al llamarla en el listener, se puede llamar multiples veces
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    //simulamos una carga de 2 segundos
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    //Si el widget ya no esta montado, no hacemos nada, esta validacion es para evitar que se hagan cambios en un widget que ya no existe
    //por ejemplo, si se navega a otra pantalla mientras se esta cargando la siguiente pagina
    if (!isMounted) return;

    setState(() {});
    moveScrollToBottom();
  }

  //funcion para refrescar la pagina, se ejecuta con el widget RefreshIndicator
  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;

    isLoading = false;
    //Eliminamos las imagenes actuales y agregamos una nueva
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);

    addFiveImages();
    setState(() {});
  }

  void moveScrollToBottom() {
    //Si el scroll esta a 100 pixeles de llegar al final de la pagina, movemos el scroll 120 pixeles para abajo
    if (scrollController.position.pixels + 100 <=scrollController.position.maxScrollExtent) return;
    //Animamos el scroll, esto se hace un la dependencia animate_do
    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  //Funcion para agregar 5 imagenes
  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //MediaQuery.removePadding nos ayuda a quitar el padding que tiene por defecto el ListView, quitamos el padding de arriba y abajo
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        //Widget propio de flutter para refrescar la pagina
        child: RefreshIndicator(
          //onRefresh es la funcion que se ejecutara cuando se haga el gesto de refrescar
          onRefresh: onRefresh,
          //editamos la posicion del indicador de refresco
          edgeOffset: 10,
          strokeWidth: 2,
          
          //Renderizamos la lista de imagenes infinitas
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                //double.infinity toma todo el ancho del padre
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/id/${imagesIds[index]}/500/300'),
              );
            },
          ),
        ),
      ),
      
      //Boton para regresar a la pantalla anterior
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
            ? SpinPerfect(
                infinite: true, child: const Icon(Icons.refresh_rounded))
            : FadeIn(child: const Icon(Icons.arrow_back)),
      ),
    );
  }
}
