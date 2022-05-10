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
    id
    active
    mood
    note
    entryType
    createdAt
    shareWithHealthWorker
    sharedAt
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
      reason
      date
      HasRescheduledAppointment
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
query patientTimeline($input: HealthTimelineInput!) {
  patientHealthTimeline(input: $input) {
    totalCount
    timeline
  }
}
''';

const String listCommunityMembersQuery = r'''
query listCommunityMembers($communityID: ID!){
	listCommunityMembers(communityID: $communityID) {
      user{
        id
        userID
        username
        role
        extraData
      }
      isModerator
  }
}
''';

const String medicalDataQuery = r'''
query medicalData($patientID: String!) {
  getMedicalData(patientID: $patientID) {
    regimen {
      Category{
        Text
      }
      MedicationCodeableConcept{
        Text
      }
    }
    allergies {
      Code{
        Text
      }
    }
    weight{
      ValueString
    }
    viralLoad {
      ValueString
    }
    bmi {
      ValueString
    }
    cd4Count {
      ValueString
    }
  }
}
''';

const String searchObservationsQuery = r'''
query SearchObservations($params: Map!) {
  searchFHIRObservation(params: $params) {
    edges {
      node {
        ID
        Status
        Code {
          Text
          Coding {
            Display
            Code
            System
            UserSelected
          }
        }
        ValueString
        EffectiveInstant
      }
    }
  }
}
''';

const String getAvailableScreeningToolQuery = r'''
query getAvailableScreeningToolQuestions($clientID: String!){
  getAvailableScreeningToolQuestions(clientID: $clientID){
    toolType
  }
}
''';

const String nextRefillQuery = r'''
query nextRefill ($clientID: ID!){
  nextRefill(clientID: $clientID)
}
''';
const String getClientCaregiverQuery = r'''
query getClientCaregiver($clientID: String!){
  getClientCaregiver(clientID: $clientID){
    firstName,
    lastName,
    phoneNumber,
    caregiverType
  }
}
''';

const String listNotificationsQuery = r'''
query listNotifications(
  $flavour: Flavour!
  $userID: ID!
  $paginationInput: PaginationsInput!
) {
  fetchNotifications(
    flavour: $flavour
    userID: $userID
    paginationInput: $paginationInput
  ) {
    notifications {
      id
      title
      body
      type
      isRead
      createdAt
    }
  }
}
''';
