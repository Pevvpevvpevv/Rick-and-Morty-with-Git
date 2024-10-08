
import UIKit

//MARK: - MockViewModel
final class MockEpisodesViewModel {
    var MockEpisodesContent: [MockEpisodesModel]
    init() {
        self.MockEpisodesContent = {
            var episodesContent: [MockEpisodesModel] = [
                (
                    MockEpisodesModel(
                        image: UIImage(
                            named: "MockImage"
                        )!,
                        characterName: "Rick Sanchez",
                        episodeName: "Pilot",
                        episodeNumber: "S01E01"
                    )
                ),
                (
                    MockEpisodesModel(
                        image: UIImage(
                            named: "MockImage"
                        )!,
                        characterName: "Rick Sanchez",
                        episodeName: "Pilot",
                        episodeNumber: "S01E01"
                    )
                ),
                (
                    MockEpisodesModel(
                        image: UIImage(
                            named: "MockImage"
                        )!,
                        characterName: "Rick Sanchez",
                        episodeName: "Pilot",
                        episodeNumber: "S01E01"
                    )
                ),
                (
                    MockEpisodesModel(
                        image: UIImage(
                            named: "MockImage"
                        )!,
                        characterName: "Rick Sanchez",
                        episodeName: "Pilot",
                        episodeNumber: "S01E01"
                    )
                ),
            ]
            return episodesContent
        }()
    }
}
