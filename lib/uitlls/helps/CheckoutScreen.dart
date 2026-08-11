import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:souq_application_1/screens/Home.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedPayment = 'visa'; // 'cash' or 'visa'

  final _cardNumCtrl = TextEditingController();
  final _cardNameCtrl = TextEditingController();
  final _expCtrl = TextEditingController();
  final _cvvCtrl = TextEditingController();

  static const _orange = Color(0xFFF97316);

  @override
  void dispose() {
    _cardNumCtrl.dispose();
    _cardNameCtrl.dispose();
    _expCtrl.dispose();
    _cvvCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Color(0xFF374151)),
        centerTitle: true,
        title: const Text(
          'إتمام الشراء',
          
          style: TextStyle(
            fontFamily: "Cairo",
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: Color(0xFF111111),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAddress(),
            const SizedBox(height: 16),
            _buildPaymentSection(),
            const SizedBox(height: 16),
            const SizedBox(height: 24),
            _buildConfirmButton(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // ----------------------------------------------------------------
  // Address
  // ----------------------------------------------------------------
  Widget _buildAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('عنوان التوصيل'),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: _cardDeco(),
          child: Row(
            children: [
              const Icon(Icons.location_on_outlined, color: _orange, size: 20),
              const SizedBox(width: 10),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('الاسم',
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF111111))),
                    SizedBox(height: 2),
                    Text("العنوان",
                        style: TextStyle(fontSize: 11, color: Color(0xFF6B7280),fontFamily: "Cairo")),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('تغيير',
                
                    style: TextStyle(color: _orange, fontSize: 11,fontFamily: "Cairo")),
              ),
            ],
          ),
        ),
      ],
    );
  }

  
  Widget _buildPaymentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle('طريقة الدفع'),
        _payOption(
          value: 'cash',
          icon: Icons.payments_outlined,
          label: 'كاش عند الاستلام',
        ),
        const SizedBox(height: 8),
        _payOption(
          value: 'visa',
          icon: Icons.credit_card_outlined,
          label: 'بطاقة فيزا / ماستركارد',
        ),
        if (_selectedPayment == 'visa') ...[
          const SizedBox(height: 12),
          _buildVisaCard(),
          const SizedBox(height: 12),
          _buildVisaForm(),
        ],
      ],
    );
  }

  Widget _payOption({
    required String value,
    required IconData icon,
    required String label,
  }) {
    final selected = _selectedPayment == value;
    return GestureDetector(
      onTap: () => setState(() => _selectedPayment = value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFFFF7ED) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? _orange : const Color(0xFFE5E7EB),
            width: selected ? 1.5 : 0.5,
          ),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected ? _orange : const Color(0xFFD1D5DB),
                  width: 1.5,
                ),
              ),
              child: selected
                  ? const Center(
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: _orange,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 10),
            Icon(icon,
                size: 18,
                color: selected ? _orange : const Color(0xFF374151)),
            const SizedBox(width: 8),
            Text(label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Cairo",
                  color: selected ? const Color(0xFF111111) : const Color(0xFF374151),
                )),
          ],
        ),
      ),
    );
  }


  Widget _buildVisaCard() {
    return ValueListenableBuilder(
      valueListenable: _cardNumCtrl,
      builder: (_, __, ___) {
        return ValueListenableBuilder(
          valueListenable: _cardNameCtrl,
          builder: (_, __, ___) {
            return ValueListenableBuilder(
              valueListenable: _expCtrl,
              builder: (_, __, ___) {
                final num = _cardNumCtrl.text.isEmpty
                    ? '•••• •••• •••• ••••'
                    : _cardNumCtrl.text;
                final name = _cardNameCtrl.text.isEmpty
                    ? 'الاسم الكامل'
                    : _cardNameCtrl.text;
                final exp = _expCtrl.text.isEmpty ? 'MM/YY' : _expCtrl.text;

                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFF97316), Color(0xFFEA580C)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Souq Pay',
                          style: TextStyle(
                              color: Colors.white70, fontSize: 10)),
                      const SizedBox(height: 12),
                      Text(num,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              fontFamily: 'Cairo')),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('حامل البطاقة',
                                  style: TextStyle(
                                    fontFamily: "Cairo",
                                      color: Colors.white60, fontSize: 9)),
                              Text(name,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 11)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text('انتهاء',
                                  style: TextStyle(
                                    fontFamily: "Cairo",
                                      color: Colors.white60, fontSize: 9)),
                              Text(exp,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 11)),
                            ],
                          ),
                          const Text('VISA',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.italic)),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  
  Widget _buildVisaForm() {
    return Column(
      children: [
        _buildField(
          label: 'رقم البطاقة',
          controller: _cardNumCtrl,
          hint: '0000 0000 0000 0000',
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            _CardNumberFormatter(),
          ],
          maxLength: 19,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 10),
        _buildField(
          label: 'اسم حامل البطاقة',
          controller: _cardNameCtrl,
          hint: 'your name',
          keyboardType: TextInputType.name,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _buildField(
                label: 'تاريخ الانتهاء',
                controller: _expCtrl,
                hint: 'MM/YY',
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  _ExpFormatter(),
                ],
                maxLength: 5,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildField(
                label: 'CVV',
                controller: _cvvCtrl,
                hint: '•••',
                maxLength: 3,
                keyboardType: TextInputType.number,
                obscure: true,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildField({
    required String label,
    required TextEditingController controller,
    required String hint,
    List<TextInputFormatter>? inputFormatters,
    int? maxLength,
    TextInputType? keyboardType,
    bool obscure = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 11, color: Color(0xFF6B7280),fontFamily: "Cairo")),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          obscureText: obscure,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          style: const TextStyle(fontSize: 13, color: Color(0xFF111111),fontFamily: "Cairo"),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFFD1D5DB), fontSize: 13),
            counterText: '',
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: Color(0xFFE5E7EB), width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: _orange, width: 1),
            ),
          ),
        ),
      ],
    );
  }

 
  Widget _summaryRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 11, color: Color(0xFF6B7280))),
          Text(value,
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: valueColor ?? const Color(0xFF111111))),
        ],
      ),
    );
  }

  
  Widget _buildConfirmButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
// في زر تأكيد الطلب
onPressed: () => showOrderSuccessDialog(context),        icon: const Icon(Icons.lock_outline, size: 16),
        label: const Text('تأكيد الطلب',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700,fontFamily: "Cairo"),),
        style: ElevatedButton.styleFrom(
          backgroundColor: _orange,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 0,
        ),
      ),
    );
  }

  
  Widget _sectionTitle(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(text,
            style: const TextStyle(
                fontSize: 11,
                color: Color(0xFF9CA3AF),
                fontFamily: "Cairo",
                letterSpacing: 0.3)),
      );

  BoxDecoration _cardDeco() => BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 0.5),
      );
}



class _CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue old, TextEditingValue next) {
    final digits = next.text.replaceAll(' ', '');
    final buffer = StringBuffer();
    for (int i = 0; i < digits.length; i++) {
      if (i > 0 && i % 4 == 0) buffer.write(' ');
      buffer.write(digits[i]);
    }
    final str = buffer.toString();
    return next.copyWith(
      text: str,
      selection: TextSelection.collapsed(offset: str.length),
    );
  }
}

class _ExpFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue old, TextEditingValue next) {
    var text = next.text.replaceAll('/', '');
    if (text.length >= 2) {
      text = '${text.substring(0, 2)}/${text.substring(2)}';
    }
    return next.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
void showOrderSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                color: Color(0xFFF97316),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 36),
            ),
            const SizedBox(height: 16),
            const Text(
              'تم الشراء بنجاح!',
              style: TextStyle(
                fontFamily: "Cairo",
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF111111)),
            ),
            const SizedBox(height: 8),
            const Text(
              'طلبك في الطريق إليك',
              style: TextStyle(fontSize: 13,                 fontFamily: "Cairo",
color: Color(0xFF6B7280)),
            ),
            const SizedBox(height: 24),
            GestureDetector(
               onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Home()),
                    );},
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF97316),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 0,
                  ),
                  child: const Text('حسناً',
                      style:
                          TextStyle(fontSize: 14,                 fontFamily: "Cairo",
              fontWeight: FontWeight.w700)),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
 