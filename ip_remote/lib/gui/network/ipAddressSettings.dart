import 'package:flutter/material.dart';

import 'package:ip_remote/bloc/blocProvider.dart';
import 'package:ip_remote/gui/network/addIpAddressDialog.dart';
import 'package:ip_remote/gui/network/ipAddressCard.dart';
import 'package:ip_remote/gui/utils/customFab.dart';
import 'package:ip_remote/gui/utils/noContentPlaceholder.dart';
import 'package:ip_remote/models/ip_address.dart';

class IpAddressSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        StreamBuilder(
          stream: BlocProvider.of(context).ipAddressBloc.ipAddressListStream,
          builder: (BuildContext context, AsyncSnapshot<List<IpAddress>> ipAddressList) {
            return ipAddressList.hasData
                ? ListView.builder(
                    itemCount: ipAddressList.data.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (ipAddressList.data.isEmpty)
                        return NoContentPlaceholder(placeholderText: 'Add IP-Addresses here');
                      if (index == ipAddressList.data.length) return SizedBox(height: 60);
                      return IpAddressCard(ipAddress: ipAddressList.data[index]);
                    },
                  )
                : SizedBox();
          },
        ),
        CustomFab(
          onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddIpAddressDialog(), fullscreenDialog: true),
              ),
          heroTag: 'addIpAddress',
        ),
      ],
    );
  }
}
