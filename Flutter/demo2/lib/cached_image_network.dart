import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageNetwork extends StatefulWidget {
  const CachedImageNetwork({super.key});

  @override
  State<CachedImageNetwork> createState() => _CachedImageNetworkState();
}

class _CachedImageNetworkState extends State<CachedImageNetwork> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(12),
        itemBuilder: (BuildContext context, int index) => ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl:
                    'https://media.istockphoto.com/id/2083910501/photo/kids-alphabet-letter-s-3d-illustration.jpg?s=612x612&w=0&k=20&c=hwxgTzGOylf2HvBcRlxb-3Fkv7cu7BppLLwrdADSyXc=',
                key: UniqueKey(),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    "Loading....",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                errorWidget: (context, index, error) => Container(
                  color: Colors.black12,
                  child: const Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 80,
                  ),
                ),
              ),
            ),
        separatorBuilder: (context, index) => const SizedBox(
              height: 12,
            ),
        itemCount: 20);
  }
}
