// Copyright 2021 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'app.dart';

void main() => runApp(MyApp(Colors.blue));

@pragma('vm:entry-point')
void topMain() => runApp(MyApp(Colors.green));

@pragma('vm:entry-point')
void bottomMain() => runApp(MyApp(Colors.purple));
