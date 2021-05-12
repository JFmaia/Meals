import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;
  const SettingsScreen(this.onSettingsChanged, this.settings);
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings;
  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Configurações'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Filtros',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Divider(thickness: 0.8),
            Expanded(
              child: ListView(
                children: [
                  _createSwitch(
                    'Sem Glutén',
                    'Só exibe reições sem glutén!',
                    settings.isGlutenFree,
                    (value) => setState(() => settings.isGlutenFree = value),
                  ),
                  Divider(thickness: 0.8),
                  _createSwitch(
                    'Sem Lactose',
                    'Só exibe reições sem Lactose!',
                    settings.isLactoseFree,
                    (value) => setState(() => settings.isLactoseFree = value),
                  ),
                  Divider(thickness: 0.8),
                  _createSwitch(
                    'Comidas Veganas',
                    'Só exibe reições Veganas!',
                    settings.isVegan,
                    (value) => setState(() => settings.isVegan = value),
                  ),
                  Divider(thickness: 0.8),
                  _createSwitch(
                    'COmidas Vegetarianas',
                    'Só exibe reições vegetarianas!',
                    settings.isVegetarian,
                    (value) => setState(() => settings.isVegetarian = value),
                  ),
                  Divider(thickness: 0.8),
                ],
              ),
            )
          ],
        ));
  }
}
