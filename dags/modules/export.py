class Exporter:
    def __init__(self, dataset: str):
        self.dataset = dataset

    def extract_from_kaggle(self) -> str:
        """
        This function downloads a dataset from Kaggle, returning the local for the downloded files.
        """
        import kagglehub

        path = kagglehub.dataset_download(self.dataset)
        return path


def run_export(kaggle_dataset: str) -> None:
    """
    This function orchestrates the export process.
    """
    exporter = Exporter(kaggle_dataset)
    exporter.extract_from_kaggle()