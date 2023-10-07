import 'package:flutter/material.dart';

class Utils {
  String AiInput = """Subject: Sponsorship Opportunity for HACK-VENGERS Event\n\nDear Ms. Nikita Gandhi,\n\nI hope this email finds you well. I am reaching out on behalf of the organizing committee for HACK-VENGERS, a highly anticipated and innovative hackathon event taking place on 13th & 14th March at Parul University, Vadodara.\n\nAt HACK-VENGERS, we strive to foster innovation, creative collaboration, and problem-solving within the tech community. Our event provides participants with a unique opportunity to work on projects, network with industry leaders, and gain valuable experience in a supportive and inclusive environment.\n\nWe believe that GOOGLE will be an excellent fit as a sponsor for our event given your company's commitment to corporate social responsibility. By partnering with us, you can gain exposure to a highly motivated and engaged audience of tech enthusiasts. The event will have a footfall of over 3,000 community members, with 8 tracks focusing on New Age Tech Challenges such as Augmented & Virtual Reality, Internet of Things, Blockchain & Crypto, and more.\n\nAs a sponsor, you can benefit from the following:\n\n1. Networking opportunities: Connect with industry leaders, investors, and talented students.\n\n2. Increased company reach among university students: Showcase your company's commitment to CSR to a targeted audience.\n\n3. Finding new talent: Get access to a pool of skilled and innovative individuals who can contribute to your organization's success.\n\n4. Extended media reach: Gain exposure through social media and other promotional channels.\n\n5. Invitation to panel discussions and speaker opportunities: Engage in discussions and share your expertise with the participants.\n\nWe have three sponsorship packages available:\n\n1. Diamond Class - worth USD 600\n   Perks: Booth Setup, Logo Mentions, Speaker/Judge Invite, LinkedIn links, Social Media posts\n\n2. Platinum Class - worth USD 450\n   Perks: Logo Mentions, Social Media posts, Speaker/Judge Invite, LinkedIn links\n\n3. Gold Class - worth USD 250\n   Perks: Logo Mentions, Social Media posts\n\nYou can find more details about the event on our website at https://hackvengers.co/. Please feel free to reach out to us via email at connect@hackvengers.co or contact our team members listed below for any further information or customization of sponsorship packages:\n\n- Aman Singh: amansingh1232@gmail.com\n- Tejash Butani: tejashbutani78@gmail.com\n- Shristi Shukla: iiitshristi@gmail.com\n- Abhishek Gharia: abhishekdzne@gmail.com\n\nWe believe that a partnership with GOOGLE would be mutually beneficial and contribute to the success of our event. We are excited about the opportunity to discuss sponsorship further and showcase the positive impact we can create together.\n\nThank you for considering our proposal. We look forward to hearing from you soon.\n\nSincerely,\n[Your Name]\n[Your Contact Information]""";

  Color getStatusColor(String sts) {
    Color c = Colors.black;
    switch (sts) {
      case 'Pending':
        c = Colors.amber.shade600;
        break;
      case 'Rejected':
        c = Colors.red.shade600;
        break;
      case 'Approved':
        c = Colors.green.shade800;
        break;
    }
    return c;
  }
}
