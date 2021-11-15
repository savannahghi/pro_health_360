const String resumeWithPinQuery = r'''
query resumeWithPhoneAndPin($pin: String!) {
   resumeWithPIN(pin: $pin)
}
''';

Map<String, dynamic> resumeWithPinQueryVariables(String pin) {
  return <String, dynamic>{'pin': pin};
}

const String getFAQQuery = r'''
query GetFaq ($flavour: Flavour!){
    getFaqsContent (flavour: $flavour){
        id
        createdAt
        excerpt
        featureImage
        html
        publishedAt
        slug
        title
        readingTime
        tags {
            id
            name
            slug
        }
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

// get library query
const String getLibraryQuery = '''
query GetLibrary{
    getLibraryContent{
        id
        createdAt
        excerpt
        featureImage
        html
        publishedAt
        slug
        title
        readingTime
        tags {
            id
            name
            slug
        }
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
