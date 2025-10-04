import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'otp_verification_screen.dart';
import 'login_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;
  String _selectedMethod = 'email'; // 'email' or 'phone'

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _sendResetInstructions() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      if (_selectedMethod == 'phone') {
        // Navigate to OTP verification for phone
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OtpVerificationScreen(
              phoneNumber: _emailController.text,
              verificationType: 'forgot_password',
            ),
          ),
        );
      } else {
        // Show success message for email
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Reset instructions sent to ${_emailController.text}'),
            backgroundColor: AppTheme.successColor,
            duration: const Duration(seconds: 3),
          ),
        );
        
        // Navigate back to login after showing message
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.backgroundGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: AppTheme.textPrimary),
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                ),
                
                const SizedBox(height: 40),
                
                // Forgot Password Icon and Text
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: AppTheme.primaryGradient,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Icon(
                          Icons.lock_reset,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'No worries, we\'ll send you reset instructions',
                        style: TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Reset Method Selection
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: AppTheme.cardDecoration,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Reset via:',
                        style: TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                      // Email Option
                      RadioListTile<String>(
                        title: const Text(
                          'Email Address',
                          style: TextStyle(color: AppTheme.textPrimary),
                        ),
                        subtitle: const Text(
                          'Get reset link via email',
                          style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
                        ),
                        value: 'email',
                        groupValue: _selectedMethod,
                        activeColor: AppTheme.accentColor,
                        onChanged: (value) {
                          setState(() {
                            _selectedMethod = value!;
                          });
                        },
                      ),
                      
                      // Phone Option
                      RadioListTile<String>(
                        title: const Text(
                          'Phone Number',
                          style: TextStyle(color: AppTheme.textPrimary),
                        ),
                        subtitle: const Text(
                          'Get OTP via SMS',
                          style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
                        ),
                        value: 'phone',
                        groupValue: _selectedMethod,
                        activeColor: AppTheme.accentColor,
                        onChanged: (value) {
                          setState(() {
                            _selectedMethod = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Form
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email/Phone Field
                      TextFormField(
                        controller: _emailController,
                        keyboardType: _selectedMethod == 'email' 
                            ? TextInputType.emailAddress 
                            : TextInputType.phone,
                        style: const TextStyle(color: AppTheme.textPrimary),
                        decoration: InputDecoration(
                          labelText: _selectedMethod == 'email' ? 'Email Address' : 'Phone Number',
                          hintText: _selectedMethod == 'email' 
                              ? 'Enter your email address'
                              : 'Enter your phone number',
                          prefixIcon: Icon(
                            _selectedMethod == 'email' ? Icons.email_outlined : Icons.phone_outlined,
                            color: AppTheme.accentColor,
                          ),
                          filled: true,
                          fillColor: AppTheme.surfaceColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: AppTheme.accentColor.withOpacity(0.3)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: AppTheme.accentColor, width: 2),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return _selectedMethod == 'email' 
                                ? 'Please enter your email address'
                                : 'Please enter your phone number';
                          }
                          
                          if (_selectedMethod == 'email') {
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                          } else {
                            if (value.length < 10) {
                              return 'Please enter a valid phone number';
                            }
                          }
                          return null;
                        },
                      ),
                      
                      const SizedBox(height: 32),
                      
                      // Send Instructions Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Container(
                          decoration: AppTheme.primaryButtonDecoration,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _sendResetInstructions,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: _isLoading
                                ? const CircularProgressIndicator(color: Colors.white)
                                : Text(
                                    _selectedMethod == 'email' 
                                        ? 'Send Reset Link'
                                        : 'Send OTP',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Info Box
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.accentColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.accentColor.withOpacity(0.3)),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: AppTheme.accentColor,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _selectedMethod == 'email'
                              ? 'We\'ll send a reset link to your email. Check your spam folder if you don\'t receive it.'
                              : 'We\'ll send a 6-digit OTP to your phone number for verification.',
                          style: const TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Back to Login Link
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        color: AppTheme.textMuted,
                        size: 16,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Back to Sign In',
                          style: TextStyle(
                            color: AppTheme.accentColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}