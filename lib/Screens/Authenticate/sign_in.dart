import 'package:brewcrew/Screens/Services/auth.dart';
import 'package:flutter/material.dart';



class Sign_In extends StatelessWidget {


  final Function toggleView;  
  Sign_In ({this.toggleView});
  
final AuthService _auth = AuthService();
 final _formkey = GlobalKey<FormState>() ;
//textflied state

String email="";
String password="";
String error='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign In '),
        centerTitle: true,
       actions: <Widget>[
         FlatButton.icon(onPressed: (){
           toggleView();
         },
          icon: Icon(Icons.person,color: Colors.white),
           label: Text('Register',style: TextStyle(color: Colors.white),
           )
           )
        ],

      ),
      body: SingleChildScrollView(
              child: Container(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 60),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20 ),
                TextFormField(
                  validator: (val)=> val.isEmpty ? 'Enter your email' :null,
                  onChanged: (val){
                   
                   setState(() => email=val);  
                    
                  }),
                  
                  SizedBox(height: 20 ),
                TextFormField(
                  validator: (val)=> val.length <6 ? 'Input atleast 6 charachters long' :null,
                  obscureText: true,
                  onChanged: (val){

                 setState (() => password=val);  
                    
                  },

                ),
                SizedBox(height:20 ),
                RaisedButton(
                  color: Colors.pink ,
                 onPressed: ()async{
                    if (_formkey.currentState.validate()) {
                      dynamic result = await _auth.signInWithEmailandpassword(email, password);
                       if (result==null){
                        setState(()=>error= 'Wrong email or password');
                      }  
                    }
                  } ,
                  textColor: Colors.white,
                  child: Text('Sign In',style: TextStyle(color: Colors.white),),
                ),
                
               

              ],
            ) ,),
                 ),
      ),
    );
  }

  void setState(String Function() param0) {}
}