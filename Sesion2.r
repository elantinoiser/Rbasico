url_name <- 'https://scholar.google.com/scholar?start=0&q=transportation+AND+resilience+AND+LITERATURE+AND+REVIEW&hl=en&as_sdt=0,5'
wp <- xml2::read_html(url_name)
titles <- rvest::html_text(rvest::html_nodes(wp, '.gs_rt'))
authors_years <- rvest::html_text(rvest::html_nodes(wp, '.gs_a'))
authors <- gsub('^(.*?)\\W+-\\W+.*', '\\1', authors_years, perl = TRUE)
years <- gsub('^.*(\\d{4}).*', '\\1', authors_years, perl = TRUE)
df <- data.frame(titles = titles, authors = authors, years = years, stringsAsFactors = FALSE)
##################################################################################################
page <- textreadr::read_html("https://scholar.google.com/citations?user=sTR9SIQAAAAJ&hl=en&oi=ao")
citations <- page %>% rvest::html_nodes ("#gsc_a_b .gsc_a_c") %>% rvest::html_text()%>%as.numeric()
