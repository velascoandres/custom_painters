import 'package:custom_painters/src/models/layout_model.dart';
import 'package:custom_painters/src/routes/routes.dart';
import 'package:custom_painters/src/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LauncherTabletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final layouModel = Provider.of<LayoutModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter - Tablet'),
        backgroundColor: appTheme.currentTheme.accentColor,
      ),
      drawer: _MenuPrincipal(),

      body: Row(
        children: [
          Container(
            width: 300,
            height: double.infinity,
            child: _ListaOpciones(),
          ),
          Container(
            width: 5,
            height: double.infinity,
            color: appTheme.darkTheme
                ? Colors.grey
                : appTheme.currentTheme.accentColor,
          ),
          Expanded(child: layouModel.currentPage)
        ],
      ),

      // body: _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, i) => Divider(
        color: appTheme.primaryColorLight,
      ),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(
          pageRoutes[i].icon,
          color: appTheme.accentColor,
        ),
        title: Text('${pageRoutes[i].title}'),
        trailing: Icon(Icons.chevron_right, color: appTheme.accentColor),
        onTap: () {
          final layouModel = Provider.of<LayoutModel>(context, listen: false);
          layouModel.currentPage = pageRoutes[i].page;
        },
      ),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return Drawer(
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: Text('AV', style: TextStyle(fontSize: 50)),
                ),
              ),
              Expanded(child: _ListaOpciones()),
              ListTile(
                leading: Icon(Icons.lightbulb_outline, color: accentColor),
                title: Text('Dark Mode'),
                trailing: Switch.adaptive(
                  activeColor: accentColor,
                  value: appTheme.darkTheme,
                  onChanged: (value) {
                    appTheme.darkTheme = value;
                  },
                ),
              ),
              SafeArea(
                bottom: true,
                top: false,
                right: false,
                left: false,
                child: ListTile(
                  leading: Icon(Icons.add_to_home_screen, color: accentColor),
                  title: Text('Custom Theme'),
                  trailing: Switch.adaptive(
                    value: appTheme.customTheme,
                    activeColor: accentColor,
                    onChanged: (value) {
                      appTheme.customTheme = value;
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
