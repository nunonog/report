#' @seealso report
#' @importFrom effectsize t_to_d
#' @importFrom parameters model_parameters
#' @importFrom insight model_info
#' @export
model_table.htest <- function(model, ...) {
  table_full <- parameters::model_parameters(model)

  # If t-test, effect size
  if (insight::model_info(model)$is_ttest) {
    table_full$Cohens_d <- effectsize::t_to_d(table_full$t, table_full$df, paired = FALSE)
  }


  table <- remove_if_possible(table_full, c("Parameter", "Group", "Mean_Group1", "Mean_Group2", "Method"))
  # Return output
  as.model_table(table, table_full)
}
