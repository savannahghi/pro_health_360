// Package imports:
import 'package:user_feed/user_feed.dart';

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

const String sendOTPQuery = r'''
query sendOTP( $userID: String!, $phoneNumber: String!, $flavour: Flavour!) {
  sendOTP(userID: $userID, phoneNumber: $phoneNumber, flavour: $flavour)
}
''';

Map<String, dynamic> sendOTPQueryVariables(
  String phoneNumber,
  Flavour flavour,
) {
  return <String, dynamic>{
    'phoneNumber': phoneNumber,
    'flavour': flavour.name,
  };
}

const String resendOTPQuery = r'''
query resendOTP( $userID: String!, $phoneNumber: String!, $flavour: Flavour!) {
  resendOTP(userID: $userID, phoneNumber: $phoneNumber, flavour: $flavour)
}
''';

Map<String, dynamic> resendOTPQueryVariables(
  String userID,
  String phoneNumber,
  Flavour flavour,
) {
  return <String, dynamic>{
    'userID': userID,
    'phoneNumber': phoneNumber,
    'flavour': flavour.name,
  };
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

const String getContentQuery = r'''
query getContent($categoryID: Int, $Limit: String!){
  getContent(categoryID: $categoryID, Limit: $Limit) {
    meta{
      totalCount
    }
    items {
      ID
      title
      date
      intro
      authorName
      tagNames
      meta{
        contentType
        contentType
        contentHTMLURL
        slug
        showInMenus
        seoTitle
        searchDescription
        firstPublishedAt
        locale
      }
      itemType
      timeEstimateSeconds
      body
      heroImage{
        ID
        title
      }
      heroImageRendition{
        url
        width
        height
        alt
      }
      likeCount
      bookmarkCount
      viewCount
      shareCount
      author {
        ID
      }
      documents {
        ID
        Document {
          ID
          title
        }
        meta{
          type
          documentDetailUrl
          documentDownloadUrl
        }
      }
      categoryDetails{
        ID
        categoryName
        categoryIcon
      }
      featuredMedia{
        ID
        url
        title
        type
        width
        height
        thumbnail
      }
      galleryImages{
        ID
        image{
          ID
          title
          meta{
            imageDetailUrl
          }
        }
      }
    }
  }
}
''';
