class Helpline {
  final String title;
  final String phone;
  final String description;

  Helpline({
    required this.title,
    required this.phone,
    required this.description,
  });
}

final List<Helpline> myCareHubHelplines = <Helpline>[
  Helpline(
    title: 'National Police SGBV Hotline',
    phone: '0800730999',
    description:
        'The national police helpline for reporting sexual gender-based'
        ' violence cases',
  ),
  Helpline(
    title: 'National GBV Hotline',
    phone: '1195',
    description:
        'The national helpline for reporting gender-based violence cases',
  ),
  Helpline(
    title: 'National Police Hotline',
    phone: '112',
    description: 'The national helpline for the Kenya Police',
  ),
  Helpline(
    title: 'National Alternative Police Hotline',
    description: 'An alternative helpline for the the Kenya Police',
    phone: '999',
  ),
  Helpline(
    title: 'LVCT Health Helpline',
    description: 'The national helpline for LVCT health',
    phone: '1190',
  ),
  Helpline(
    title: 'Childline Kenya',
    description:
        'Report abuse of any child and any other concerns that cause distress'
        ' to them',
    phone: '116',
  ),
  Helpline(
    title: 'COVAW GBV Toll Free Line',
    phone: '0800720553',
    description:
        'The national helpline for the Coalition on Violence Against Women'
        ' (COVAW)',
  ),
];
