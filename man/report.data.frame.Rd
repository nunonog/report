% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/report.character.R, R/report.data.frame.R,
%   R/report.factor.R, R/report.numeric.R
\name{report.character}
\alias{report.character}
\alias{report.data.frame}
\alias{report.factor}
\alias{report.numeric}
\title{Data frame Report}
\usage{
\method{report}{character}(
  model,
  n_entries = 3,
  levels_percentage = FALSE,
  missing_percentage = FALSE,
  ...
)

\method{report}{data.frame}(
  model,
  centrality = "mean",
  dispersion = TRUE,
  range = TRUE,
  distribution = FALSE,
  levels_percentage = FALSE,
  n_entries = 3,
  missing_percentage = FALSE,
  ...
)

\method{report}{factor}(model, levels_percentage = FALSE, ...)

\method{report}{numeric}(
  model,
  centrality = "mean",
  dispersion = TRUE,
  range = TRUE,
  distribution = FALSE,
  missing_percentage = FALSE,
  digits = 2,
  ...
)
}
\arguments{
\item{model}{A data.frame or a vector.}

\item{n_entries}{Number of different character entries to show. Can be "all".}

\item{levels_percentage}{Show characters entries and factor levels by number (default) or percentage.}

\item{missing_percentage}{Show missings by number (default) or percentage.}

\item{...}{Arguments passed to or from other methods.}

\item{centrality}{Character vector, indicating the index of centrality (either \code{"mean"} or \code{"median"}).}

\item{dispersion}{Show index of dispersion (\link{sd} if \code{centrality = "mean"}, or \link{mad} if \code{centrality = "median"}).}

\item{range}{Show range.}

\item{distribution}{Returns kurtosis and skewness in table.}

\item{digits}{Number of significant digits.}
}
\value{
A list-object of class \code{report}, which contains further list-objects
with a short and long description of the model summary, as well as a short
and long table of parameters and fit indices.
}
\description{
Create a report of a data frame.
}
\examples{
x <- c("A", "B", "C", "A", "B", "B", "D", "E", "B", "D", "A")
report(x)
model_table(x)
model_text(x)
summary(model_table(x))
summary(model_text(x))
library(report)

r <- report(iris, centrality = "median", dispersion = FALSE,
            distribution = TRUE, missing_percentage = TRUE)
r
summary(r)
as.data.frame(r)
summary(as.data.frame(r))

if (require("dplyr")) {
  r <- iris \%>\%
    dplyr::group_by(Species) \%>\%
    report()
  r
  summary(r)
  as.data.frame(r)
  summary(as.data.frame(r))
}
x <- factor(rep(c("A", "B", "C"), 10))
report(x)
model_table(x)
model_text(x)
summary(model_table(x))
summary(model_text(x))
x <- rnorm(1000)
report(x)
report(x, centrality = "median", missing_percentage = TRUE, distribution = TRUE)
model_table(x)
model_text(x)
summary(model_table(x))
summary(model_text(x))
}
\seealso{
report
}
