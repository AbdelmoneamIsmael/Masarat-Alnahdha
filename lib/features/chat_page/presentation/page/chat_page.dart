import 'package:flutter/material.dart';
import 'package:masarat_alnahdha/core/generated/app_image.dart';
import 'package:masarat_alnahdha/core/widgets/custom_app_bar.dart';
import 'package:masarat_alnahdha/core/widgets/screen_wrapper.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
      appBar: CustomAppBar(
        title: 'تواصل معنا',
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(13),
          child: Image.asset(AppImage.dividerImage),
        ),
      ),
      body: const ChatView(),
    );
  }
}

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<_Message> _messages = <_Message>[
    _Message(
      text: 'مرحبا! كيف يمكنني مساعدتك اليوم؟',
      isMe: false,
      time: DateTime.now().subtract(const Duration(minutes: 15)),
    ),
    _Message(
      text: 'أرغب في معرفة المزيد عن منتجاتكم.',
      isMe: true,
      time: DateTime.now().subtract(const Duration(minutes: 14)),
    ),
    _Message(
      text: 'أكيد! ما الفئة التي تهمك؟',
      isMe: false,
      time: DateTime.now().subtract(const Duration(minutes: 13)),
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(_Message(text: text, isMe: true, time: DateTime.now()));
    });
    _controller.clear();
    Future.delayed(const Duration(milliseconds: 50), _scrollToBottom);
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final isDark = theme.brightness == Brightness.dark;
    // final bottomInset = MediaQuery.of(
    //   context,
    // ).viewInsets.bottom; // keyboard height when open

    return Directionality(
      textDirection: TextDirection.rtl,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                reverse: true,
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  // Because reverse: true, show from the end of list
                  final message = _messages[_messages.length - 1 - index];
                  return _MessageBubble(
                    message: message,
                    isDark: Theme.of(context).brightness == Brightness.dark,
                  );
                },
              ),
            ),
            const SizedBox(height: 4),
            _InputBar(
              controller: _controller,
              onSend: _sendMessage,
              onFocus: _scrollToBottom,
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
      ),
    );
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }
}

class _InputBar extends StatelessWidget {
  const _InputBar({
    required this.controller,
    required this.onSend,
    this.onFocus,
  });

  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback? onFocus;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.camera_alt_outlined),
              onPressed: () {},
              tooltip: 'الكاميرا',
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest.withOpacity(
                    0.6,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: const Color(0xFF43A047).withOpacity(0.1),
                    width: 0.8,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        minLines: 1,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: 'اكتب رسالة...',
                          border: InputBorder.none,
                        ),
                        onSubmitted: (_) => onSend(),
                        onTap: onFocus,
                      ),
                    ),
                    // IconButton(
                    //   icon: const Icon(Icons.mic_none_outlined),
                    //   onPressed: () {},
                    //   tooltip: 'تسجيل صوتي',
                    // ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF2E7D32),
                    Color(0xFF43A047),
                    Color(0xFF81C784),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.send_rounded, color: Colors.white),
                onPressed: onSend,
                tooltip: 'إرسال',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({required this.message, required this.isDark});

  final _Message message;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;
    final bubbleRadius = BorderRadius.only(
      topLeft: const Radius.circular(18),
      topRight: const Radius.circular(18),
      bottomLeft: Radius.circular(isMe ? 18 : 4),
      bottomRight: Radius.circular(isMe ? 4 : 18),
    );

    Widget bubbleContent = Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      decoration: BoxDecoration(
        color: isMe
            ? null
            : (isDark ? const Color(0xFF2C2C2E) : const Color(0xFFF2F2F7)),
        gradient: isMe
            ? const LinearGradient(
                colors: [
                  Color(0xFF2E7D32),
                  Color(0xFF43A047),
                  Color(0xFF81C784),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        borderRadius: bubbleRadius,
      ),
      child: Text(
        message.text,
        style: TextStyle(
          color: isMe ? Colors.white : (isDark ? Colors.white : Colors.black87),
          fontSize: 15,
          height: 1.3,
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMe) ...[
            const CircleAvatar(radius: 14, child: Icon(Icons.person, size: 16)),
            const SizedBox(width: 8),
          ],
          Flexible(child: bubbleContent),
          if (isMe) const SizedBox(width: 8),
          if (isMe)
            const CircleAvatar(
              radius: 14,
              backgroundColor: Colors.transparent,
              child: Icon(Icons.check, size: 16, color: Colors.grey),
            ),
        ],
      ),
    );
  }
}

class _Message {
  final String text;
  final bool isMe;
  final DateTime time;

  _Message({required this.text, required this.isMe, required this.time});
}
