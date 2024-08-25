import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/forum_post_model.dart';
import '../post_notifier.dart';
import 'package:image_picker/image_picker.dart';

class CommunityForumScreen extends StatelessWidget {
  void _pickImage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _showAddPostDialog(context, pickedFile);
      }
    } catch (e) {
      // Handle the error or inform the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to pick image: $e")),
      );
    }
  }

  void _addPost(BuildContext context, String content, XFile imageFile) {
    final newPost = ForumPost(
      id: DateTime.now().toString(),
      author: 'User', 
      content: content,
      imageUrl:
          imageFile.path, 
    );
    Provider.of<PostNotifier>(context, listen: false).addPost(newPost);
  }

  void _showAddPostDialog(BuildContext context, XFile imageFile) {
    String content = '';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text(
            'New Post',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) => content = value,
                decoration: const InputDecoration(
                  hintText: "What's on your mind?",
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
            ],
          ),
          actions: [
            TextButton(
              child: const Text(
                'Post',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                if (content.isNotEmpty) {
                  Navigator.of(context).pop(); 
                  _addPost(
                      context, content, imageFile); 
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Forum'),
        backgroundColor: Colors.tealAccent,
      ),
      body: Consumer<PostNotifier>(
        builder: (context, postNotifier, child) {
          return ListView.builder(
            itemCount: postNotifier.posts.length,
            itemBuilder: (context, index) {
              final post = postNotifier.posts[index];
              return Card(
                margin: const EdgeInsets.all(8.0),
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Column(
                    children: [
                      if (post.imageUrl != null)
                        Image.file(
                          File(post.imageUrl!),
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          post.content,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () =>
            _pickImage(context), 
      ),
    );
  }
}
