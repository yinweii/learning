class GraphQuery {
  static String query = r""" 
  query getJobs{
	jobs{
		id
		title
		applyUrl
		locationNames
		userEmail
		createdAt
    description
    isPublished
    updatedAt
	}
}
""";
}
