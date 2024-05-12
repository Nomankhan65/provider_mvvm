import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_mvvm/data/response/status.dart';
import 'package:provider_mvvm/res/colors.dart';
import 'package:provider_mvvm/utils/routes/route_name.dart';
import 'package:provider_mvvm/view_model/home_view_view_model.dart';
import 'package:provider_mvvm/view_model/user_view_model.dart';

class HomeView extends StatefulWidget {
    HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeViewViewModel=HomeViewViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewViewModel.getMoviesListApi();
  }
  @override
  Widget build(BuildContext context) {
    final userViewModel=Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar:AppBar(
        backgroundColor:AppColors.skyBLue,
        automaticallyImplyLeading: false,
        title:const Text('Home view',style:TextStyle(color:AppColors.white),),
        actions: [
          IconButton(onPressed: (){
            userViewModel.removeUser().then((value) => {
              Navigator.pushNamed(context, RoutesName.loginScreen),
            });
          }, icon:const Icon(Icons.logout,color:AppColors.white,)
    )
        ],
      ),
      body:ChangeNotifierProvider<HomeViewViewModel>(

        create:(BuildContext context)=>homeViewViewModel,
      child:Consumer<HomeViewViewModel>(builder: (context,value,_){
        switch(value.moviesList.status){
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator(color:AppColors.skyBLue,));
          case Status.ERROR:
            return Center(child: Text(value.moviesList.message.toString()));
          case Status.COMPLETED:
            return ListView.builder(
                itemCount:value.moviesList.data?.tvShows?.length,
                itemBuilder:(context,index){
                  var data=value.moviesList.data!.tvShows![index];
                  return ListTile(
                    leading: Image.network(data.imageThumbnailPath.toString(),
                    errorBuilder:(context,error,stack){
                      return const Icon(Icons.error,color:Colors.redAccent,);
                    },

                    ),
                    title:Text(data.name.toString()),
                    subtitle:Text(data.startDate.toString()),
                    trailing:Text(data.status.toString()),
                    onTap:(){
                      showDialog(context: context, builder:(context){
                        return AlertDialog(
                          backgroundColor:AppColors.white,
                          title:Text(data.name.toString()),
                          content:Image.network(data.imageThumbnailPath.toString(),fit:BoxFit.cover,
                            errorBuilder:(context,error,stack){
                        return const Icon(Icons.error,color:Colors.redAccent,);
                        },
                          ),
                        );
                      });
                    },
                  );
            });
          default:return const Text('No data found');
        }
      })
      ),
    );
  }
}
