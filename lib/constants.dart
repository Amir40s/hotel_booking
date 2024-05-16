import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

const primaryColor = Color(0xFFF5AE14);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);
const drawerBackground = Color(0xFF212332);
const hoverColor = Color(0xFFfe9f42);

const defaultPadding = 16.0;
const defaultBorderRadius = 10.0;
const defaultDrawerHeadHeight = 20.0;


var appPassword = "zwdc oglc ghzq yiri";
const DASHBOARD_SVG = "assets/icons/menu_dashboard.svg";


//firebase firestore
var firestore = FirebaseFirestore.instance;


const key_name = "name";
const key_phone = "phone";
const key_dropOff = "dropOff";
const key_pickup = "pickup";
const key_driverNote = "driverNote";
const key_bookStatus = "bookStatus";
const key_status = "status";
const key_date = "date";
const key_time = "time";

