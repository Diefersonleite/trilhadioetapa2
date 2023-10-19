import 'package:flutter/material.dart';
import 'package:trilhadio/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() =>  _LoginPageState();
}

class  _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: "");//utilizado para "lembrar" o que o usuário digitou
  TextEditingController senhaController = TextEditingController(text: "");
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(//para não sobrescrever a barra de status do app
      child: Scaffold(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),//cor do fundo
        body: SingleChildScrollView(//incluir para tratar erro do teclado
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height
            ),//MediaQuery pega o tamanho da tela do dispositivo
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, //tudo alinhado ao centro
              children: [
                const SizedBox(height: 50,),
                Row(//para trabalhar com proporcionalidade da imagem
                  children: [
                    Expanded(child: Container()),//todo Expanded sem flex é igual a 1
                    Expanded(//a vantage do Expanded é que a tela fica dinâmica para cada telefone
                      flex: 4,
                      child: Image.network(
                        "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                      ),
                    ),
                    Expanded(child: Container()),
                  ],
                ),
                const SizedBox(height: 20,),
                const Text(
                  "Já tem cadastro?",
                  style: TextStyle(fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Colors.white)),
                const SizedBox(height: 8,),
                const Text(
                  "Faça seu login e make the change_",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white)),
                const SizedBox(height: 40,),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: TextField(
                    controller: emailController,
                    onChanged: (value) {
                      //email = value;
                      debugPrint(value);
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 0),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 206, 77, 223)
                        )
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 206, 77, 223)
                        )
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Color.fromARGB(255, 206, 77, 223),
                    )),
                  ),
                ),
                const SizedBox(height: 15,),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: TextField(
                    obscureText: isObscureText,//a senha aparece em *
                    controller: senhaController,
                    onChanged: (value) {//passa em uma string o que foi digitado na caixa
                      debugPrint(value);
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(top: 0),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 206, 77, 223)
                        )
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 206, 77, 223)
                        )
                      ),
                      hintText: "Senha",
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color.fromARGB(255, 206, 77, 223),
                      ),
                      suffixIcon: InkWell(//também é possível usar o GestureDetector
                        onTap: () {
                          setState(() {
                          isObscureText = !isObscureText;
                          });
                        },
                        child: Icon(
                          isObscureText ? Icons.visibility_off : Icons.visibility,
                          color: const Color.fromARGB(255, 206, 77, 223),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        if(emailController.text.trim() == "email@gmail.com" && senhaController.text.trim() == "123") {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainPage()));
                            //pushReplacement diz ao app para esquecer a stack
                            //apenas push é possível voltar a tela anterior
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Erro ao efetuar login!")));
                            debugPrint("Erro ao efetuar o login!");
                          }
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 206, 77, 223))),
                      child: const Text(
                        "ENTRAR",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      )),
                  ),
                ),
                Expanded(child: Container()),
                const SizedBox(height: 20,),
                Container(
                  //width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: const Text(
                    "Esqueci minha senha",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,//espaçamento em relação a parte inferior da tela
                ),
                Container(
                  //width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  alignment: Alignment.center,
                  child: const Text(
                    "Criar conta",
                    style: TextStyle(color: Colors.green,
                    fontWeight: FontWeight.w400)),
                ),
                const SizedBox(
                  height: 60,//espaçamento em relação a parte inferior da tela
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}