import 'package:flutter/material.dart';
import 'package:intranet_movil/model/employee_profile.dart';
import 'package:intranet_movil/model/publication.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/services/api_employee_profile.dart';
import 'package:intranet_movil/services/api_publications.dart';
import 'package:intranet_movil/services/api_user.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/chat/chat_page.dart';
import 'package:intranet_movil/views/home/home_page.dart';
import 'package:intranet_movil/views/home/widget/publication_builder.dart';
import 'package:intranet_movil/widget/skeletons/list_view_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployeeProfilePage extends StatefulWidget {
  const EmployeeProfilePage(
      {Key? key, required this.employeeID, required this.employeeName})
      : super(key: key);
  final int employeeID;
  final String employeeName;

  @override
  _EmployeeProfileState createState() => _EmployeeProfileState();
}

class _EmployeeProfileState extends State<EmployeeProfilePage> {
  late List<UserModel>? _userModel = [];
  late List<PublicationModel>? _publicationModel = [];
  late List<EmployeeProfileModel>? _employeeProfileModel = [];

  late List<PublicationModel>? _publicationModelToLike = [];
  bool isLike = false;
  late String token = "";

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final prefs = await SharedPreferences.getInstance();
    String? _token = prefs.getString('token');
    if (_token != null || _token!.isNotEmpty) {
      token = _token;
    }
    _userModel =
        (await ApiUserService().getUsers(_token.toString()))!.cast<UserModel>();
    _publicationModel =
        (await ApiPublicationService().getPublication(_token.toString()))!
            .cast<PublicationModel>();
    _employeeProfileModel = (await ApiEmployeeProfileService()
            .getEmployeeProfile(widget.employeeID.toString()))!
        .cast<EmployeeProfileModel>();
    _publicationModel =
        _publicationModel!.where((i) => i.userId == widget.employeeID).toList();
    _publicationModelToLike = _publicationModel;

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const ChatPage()));
              },
              child: const Icon(
                Icons.chat_rounded,
                size: 24.0,
              ),
            ),
          ),
        ],
        title: Text(widget.employeeName),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()))),
      ),
      body: _userModel == null ||
              _userModel!.isEmpty ||
              _employeeProfileModel == null ||
              _employeeProfileModel!.isEmpty
          ? const ListviewProfile()
          : SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                children: [
                  ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    itemCount: _employeeProfileModel!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200.0,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("lib/assets/background.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Align(
                              alignment: const Alignment(0, 2.5),
                              child: SizedBox(
                                width: 120.0,
                                height: 120.0,
                                child: OverflowBox(
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        ApiIntranetConstans.baseUrl +
                                            _employeeProfileModel![0].photo),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 80.0),
                          ),
                          Column(
                            children: [
                              Text(
                                _employeeProfileModel![0].fullname,
                                style: const TextStyle(
                                  fontSize: 20.00,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 14.0),
                              ),
                              Text(
                                _employeeProfileModel![0].position,
                                style: const TextStyle(fontSize: 16.00),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 36.0),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 24.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.house),
                                        const Padding(
                                            padding:
                                                EdgeInsets.only(right: 8.0)),
                                        Text(_employeeProfileModel![0]
                                            .department)
                                      ],
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 12.0)),
                                    Row(
                                      children: [
                                        const Icon(Icons.work),
                                        const Padding(
                                            padding:
                                                EdgeInsets.only(right: 8.0)),
                                        Text(_employeeProfileModel![0].position)
                                      ],
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 12.0)),
                                    Row(
                                      children: [
                                        const Icon(Icons.mail),
                                        const Padding(
                                            padding:
                                                EdgeInsets.only(right: 8.0)),
                                        Text(_employeeProfileModel![0].email)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  const Padding(padding: EdgeInsets.only(top: 32)),
                  Container(
                    height: 8,
                    color: ColorIntranetConstants.backgroundColorDark,
                  ),
                  //Publicaciones
                  _publicationModel == null || _publicationModel!.isEmpty
                      ? const Text(
                          StringIntranetConstants.homePublicationEmpty,
                          textAlign: TextAlign.left,
                        )
                      : PublicationBuilder(
                          publicationData: _publicationModel!,
                          publicationToLikeData: _publicationModelToLike!,
                          userData: _userModel!,
                          isLike: isLike,
                          token: token,
                          MainContext: context)
                ],
              ),
            ),
    );
  }
}
