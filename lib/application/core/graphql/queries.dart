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

// Feed content query
const String getFeedQuery = r'''
query GetFeed(
  $flavour: Flavour!,
  $isAnonymous: Boolean!,
  $persistent: BooleanFilter!,
  $status: Status,
	$visibility: Visibility,
	$expired: BooleanFilter
) {
  getFeed(
    flavour:$flavour,
    isAnonymous:$isAnonymous,
    persistent:$persistent, 
    status:$status, 
    visibility:$visibility,
    expired:$expired
  ) {
    uid
    isAnonymous
    flavour
    actions {
      id
      sequenceNumber
      name
      actionType
      handling
      allowAnonymous
      icon {
        url
        thumbnail
      }
    }
    nudges {
      id
      sequenceNumber
      visibility
      status
      title
      text
      actions {
        id
        sequenceNumber
        name
        actionType
        handling
        allowAnonymous
      }
      groups
      users
      links {
        id
        url
        linkType
      }
      notificationChannels
    }
    items {
      id
      sequenceNumber
      expiry
      persistent
      status
      visibility
      label
      icon {
        id
        url
        linkType
      }
      author
      tagline
      label
      timestamp
      summary
      text
      links {
        id
        url
        linkType
        title
        description
        thumbnail
      }
      actions {
        id
        sequenceNumber
        name
        actionType
        handling
        allowAnonymous
      }
      conversations {
        id
        sequenceNumber
        text
        replyTo
        postedByUID
        postedByName
        timestamp
      }
    }
  }
}
''';
