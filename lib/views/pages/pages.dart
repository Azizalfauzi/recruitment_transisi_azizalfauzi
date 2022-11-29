import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recruitment_transisi_azizalfauzi/cubit/api/create_user/create_user_cubit.dart';
import 'package:recruitment_transisi_azizalfauzi/cubit/api/get_user/get_user_cubit.dart';
import 'package:recruitment_transisi_azizalfauzi/cubit/api/list_user/list_user_cubit.dart';
import 'package:recruitment_transisi_azizalfauzi/cubit/api/login_cubit/login_cubit.dart';
import 'package:recruitment_transisi_azizalfauzi/services/services.dart';
import 'package:recruitment_transisi_azizalfauzi/shared/shared.dart';
import 'package:recruitment_transisi_azizalfauzi/views/widget/widget.dart';
// ignore: depend_on_referenced_packages
import 'package:another_flushbar/flushbar.dart';
import '../../cubit/routes/routes_cubit.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_page.dart';
part 'detail_user_page.dart';
part 'adding_user_page.dart';
part 'wrapper.dart';
part 'login_page.dart';
