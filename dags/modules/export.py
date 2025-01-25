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


    def list_all_downloaded_files(self, localpath: str) -> list:
        """
        This function lists all files in a given directory.
        """
        import os

        return os.listdir(localpath)


    def convert_csv_file_into_parquet(self, filepath: str) -> None:
        """
        This function converts a CSV file into a Parquet file.
        """
        import polars as pl
        import os

        filename = filepath.split("/")[-1].split(".")[0]
        output_path = f"/opt/airflow/datalake/bronze/{filename}.parquet"
        pl.read_csv(filepath).write_parquet(output_path)
        assert os.path.isfile(output_path)


def run_export(kaggle_dataset: str) -> None:
    """
    This function orchestrates the export process.
    """
    exporter = Exporter(kaggle_dataset)
    localpath = exporter.extract_from_kaggle()
    files = exporter.list_all_downloaded_files(localpath)
    for file in files:
        exporter.convert_csv_file_into_parquet(f"{localpath}/{file}")