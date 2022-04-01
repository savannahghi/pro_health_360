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

const String getTermsQuery = r'''
query getCurrentTerms($flavour: Flavour!) {
  getCurrentTerms(flavour: $flavour) {
    termsID
    text
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
          meta {
            documentDetailUrl
            documentDownloadUrl
          }
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
        duration
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

const String getFAQContentQuery = r'''
query getFAQContent($flavour: Flavour!, $limit: Int!){
  getFAQContent(flavour: $flavour, limit: $limit ){
    ID
    Active
    Title
    Description
    Body
    Flavour
  }
}
''';

const String verifyPinQuery = r'''
query verifyPin($userID: String!, $flavour:Flavour!, $pin: String!){
  verifyPIN(userID: $userID, flavour: $flavour, pin: $pin)
}
''';

const String retrieveFacilityQuery = r'''
query retrieveFacility($id: String!, $active: Boolean!){
  retrieveFacility(id: $id, active: $active){
    ID
    name
    code
    county
    active
    phone
    description
  }
}
''';

const String listUserInvitedCommunitiesQuery = r'''
query listPendingInvites($memberID: String!, $input: QueryOption){
  listPendingInvites(memberID: $memberID, input: $input){
    id
    name
    memberCount
    gender
    description
    createdBy{
      ID
    }
  }
}
''';

const String recommendedCommunitiesQuery = r'''
query recommendedCommunities($clientID: String!, $limit: Int!) {
  recommendedCommunities(clientID: $clientID, limit: $limit) {
    id
    name
    memberCount
  }
}
''';

const String listAppointmentsQuery = r'''
query listAppointments(
  $clientID: ID!
  $paginationInput: PaginationsInput!
  $filters: [FilterParam!]
) {
  fetchClientAppointments(
    clientID: $clientID
    paginationInput: $paginationInput
    filters: $filters
  ) {
    appointments {
      ID
      type
      reason
      status
      date
      start
      end
    }
  }
}
''';

const String getScreeningToolsQuestionsQuery = r'''
query getScreeningToolQuestions($toolType: String!){
  getScreeningToolQuestions(toolType: $toolType){
    id,
    question,
    toolType,
    responseType,
    responseChoices,
    responseCategory,
    sequence,
    active,
    meta
  }
}
''';

const String patientTimelineQuery = r'''
query patientTimeline($patientID: String!, $count: Int!) {
  patientTimeline(patientID: $patientID, count: $count)
}
''';
