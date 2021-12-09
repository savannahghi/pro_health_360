// Package imports:

const String getCategoriesQuery = '''
query listContentCategories{
  listContentCategories{
   id
   name
   iconUrl
  }
}
''';

const String canRecordMoodQuery = r'''
query canRecordMood($clientID: String!){
  canRecordMood(clientID:$clientID )
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
        duration
        width
        height
        thumbnail
        duration
      }
      galleryImages{
        ID
        image{
          ID
          title
          meta{
            imageDownloadUrl
          }
        }
      }
    }
  }
}
''';

const String getHealthDiaryQuoteQuery = '''
query getHealthDiaryQuote {
  getHealthDiaryQuote {
    quote
    author
  }
}
''';

const String getHealthDiaryEntriesQuery = r'''
query getHealthDiaryEntries($clientID: String!){
  getClientHealthDiaryEntries(clientID: $clientID){
    active
    mood
    note
    entryType
    createdAt
  }
}
''';
const String checkIfUserHasLikedContentQuery = r'''
query checkIfUserHasLikedContent($userID: String!, $contentID: Int!){
  checkIfUserHasLikedContent(userID: $userID, contentID: $contentID)
}
''';

const String checkIfUserBookmarkedContentQuery = r'''
query checkIfUserBookmarkedContent($userID: String!, $contentID: Int!) {
  checkIfUserBookmarkedContent(userID: $userID, contentID: $contentID)
}
''';

const String checkIfUserBookmarkedContentMutation = r'''
query checkIfUserBookmarkedContent($userID: String!, $contentID: Int!) {
  checkIfUserBookmarkedContent(userID: $userID, contentID: $contentID)
}
''';

const String getUserBookmarkedContentQuery = r'''
query getUserBookmarkedContent($userID: String!){
  getUserBookmarkedContent(userID: $userID){
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
            type
            imageDetailUrl
            imageDownloadUrl
          }
        }
      }
    }
  }
}
''';
