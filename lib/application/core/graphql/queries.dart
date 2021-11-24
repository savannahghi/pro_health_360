// Package imports:

const String loginQuery = r'''
query login($phoneNumber: String!, $pin: String!, $flavour: Flavour!) {
  login(flavour: $flavour, phoneNumber: $phoneNumber, pin: $pin) {
    code
    message
    credentials {
      expiresIn
      idToken
      refreshToken
    }
    clientProfile {
      active
      addresses {
        active
        addressType
        country
        county
        postalCode
        text
      }
      clientCounselled
      clientType
      facilityID
      relatedPersons {
        active
        dateOfBirth
        firstName
        gender
        lastName
        otherName
        relatedTo
        relationshipType
        addresses {
          active
          addressType
          country
          county
          postalCode
          text
        }
        primaryContact {
          active
          contact
          contactType
          optedIn
        }
        secondaryContacts {
          active
          contact
          contactType
          optedIn
        }
      }
      treatmentBuddy
      treatmentEnrollmentDate
      user {
        active
        displayName
        firstName
        gender
        languages
        suspended
        avatar
        primaryContact {
          active
          contact
          contactType
          optedIn
        }
        secondaryContacts {
          active
          contact
          contactType
          optedIn
        }
        lastName
        middleName
        pinChangeRequired
        termsAccepted
        userID
        userName
        userType
        dateOfBirth
      }
    }
  }
}
''';

const String resumeWithPinQuery = r'''
query resumeWithPhoneAndPin($pin: String!) {
   resumeWithPIN(pin: $pin)
}
''';

Map<String, dynamic> resumeWithPinQueryVariables(String pin) {
  return <String, dynamic>{'pin': pin};
}

const String getSecurityQuestionsQuery = r'''
query getSecurityQuestions($flavour: Flavour!) {
  getSecurityQuestions(flavour: $flavour) {
    SecurityQuestionID
    QuestionStem
    Description
    Active
    ResponseType
  }
}
''';

const String getTermsQuery = '''
query getCurrentTerms {
  getCurrentTerms {
    termsID
    text
  }
}
''';

const String fetchRecentContentQuery = '''
query fetchRecentContent {
  fetchRecentContent {
    author
    authorAvatar
    body
    contentID
    contentType
    createdAt
    estimate
    heroImage
    isNew
    publicLink
    tags
    title
  }
}
''';

const String fetchSuggestedGroupsQuery = '''
query fetchSuggestedGroups {
  fetchSuggestedGroups {
    avatar
    members
    name
  }
}
''';

const String fetchContentQuery = r'''
  query fetchContent($limit: Int!, $tags: [String!]! ) {
  fetchContent(limit: $limit, tags: $tags) {
    author
    authorAvatar
    body
    contentID
    contentType
    createdAt
    estimate
    heroImage
    isNew
    publicLink
    tags
    title
  }
}''';
