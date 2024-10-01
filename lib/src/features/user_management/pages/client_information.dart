import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_colors.dart';
import 'package:flutter_application_radisha_admin_pannel/src/common/const/app_global_variable.dart';

String pdf = 'assets/images/pdf.png';

class RadishaInformationPage extends StatelessWidget {
  const RadishaInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColor.backGround,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          color: colorScheme(context).surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row for Profile and Document Sections
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Section
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundColor:
                                    AppColor.appGreen.withOpacity(0.5),
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'https://images0.persgroep.net/rcs/BUjKzrzYSmwLekbUo-gCY7XPegI/diocontent/180827814/_fitwidth/694/?appId=21791a8992982cd8da851550a453bd7f&quality=0.8',
                                    // Replace with the actual image URL
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                    fit: BoxFit.cover,
                                    width: 100.0,
                                    height: 100.0,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Jhone Smith',
                                    style: textTheme(context)
                                        .headlineSmall
                                        ?.copyWith(
                                          color: colorScheme(context).onSurface,
                                        ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Jhone@gmail.com',
                                    style: textTheme(context)
                                        .bodySmall
                                        ?.copyWith(color: AppColor.lightBlack),
                                  ),
                                  Text(
                                    '+1 2365478965',
                                    style: textTheme(context)
                                        .bodySmall
                                        ?.copyWith(color: AppColor.lightBlack),
                                  ),
                                  const SizedBox(height: 4),
                                  RichText(
                                    text: TextSpan(
                                      style: textTheme(context)
                                          .bodySmall
                                          ?.copyWith(
                                            color: AppColor.lightBlack
                                                .withOpacity(0.4),
                                          ),
                                      children: [
                                        TextSpan(
                                            text: 'Preferred Service: ',
                                            style: textTheme(context)
                                                .bodySmall
                                                ?.copyWith(
                                                  color: AppColor.lightBlack,
                                                )),
                                        TextSpan(
                                            text: 'Cleaning, Plumbing',
                                            style: textTheme(context)
                                                .bodySmall
                                                ?.copyWith(
                                                    color: AppColor.lightBlack
                                                        .withOpacity(0.9))),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: textTheme(context)
                                          .bodySmall
                                          ?.copyWith(
                                            color: AppColor.lightBlack,
                                          ),
                                      children: [
                                        TextSpan(
                                          text: 'Experience:',
                                          style: textTheme(context)
                                              .bodySmall
                                              ?.copyWith(),
                                        ),
                                        TextSpan(
                                            text: ' 3 Years ',
                                            style: textTheme(context)
                                                .bodySmall
                                                ?.copyWith(
                                                    color: AppColor.lightBlack
                                                        .withOpacity(0.9))),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: textTheme(context)
                                          .bodyMedium
                                          ?.copyWith(
                                            color: AppColor.lightBlack,
                                          ),
                                      children: [
                                        const TextSpan(
                                            text: 'Payment Methods: '),
                                        TextSpan(
                                          text: 'Visa ending in ****1234',
                                          style: textTheme(context)
                                              .bodyMedium
                                              ?.copyWith(
                                                  color: AppColor.lightBlack
                                                      .withOpacity(0.9)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: textTheme(context)
                                          .bodySmall
                                          ?.copyWith(
                                            color: AppColor.lightBlack,
                                          ),
                                      children: [
                                        TextSpan(
                                          text: 'Uploaded Documents: ',
                                          style: textTheme(context)
                                              .bodySmall
                                              ?.copyWith(
                                                  color: AppColor.lightBlack),
                                        ),
                                        TextSpan(
                                            text: 'Yes',
                                            style: textTheme(context)
                                                .bodySmall
                                                ?.copyWith(
                                                    color: AppColor.lightBlack
                                                        .withOpacity(0.9))),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Job History',
                                    style: textTheme(context)
                                        .bodySmall
                                        ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color:
                                                colorScheme(context).onSurface),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  _buildActionButton('View', context)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 30),
                    // Document Section
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center, // Centering the Row
                            children: [
                              _buildActionButton('Contact', context,
                                  outlined: true),
                              const SizedBox(width: 10),
                              _buildActionButton('Edit', context),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Document',
                            style: textTheme(context).headlineMedium?.copyWith(
                                color: AppColor.lightBlack,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                pdf, // Add your PDF icon path
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(width: 3),
                              Column(
                                children: [
                                  Text(
                                    'Jameet - CV - UI/UX ',
                                    style:
                                        textTheme(context).labelSmall?.copyWith(
                                              color: AppColor.lightBlack,
                                              fontWeight: FontWeight.w400,
                                            ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'Designer.PDF',
                                    style:
                                        textTheme(context).labelSmall?.copyWith(
                                              color: AppColor.lightBlack,
                                              fontWeight: FontWeight.w400,
                                            ),
                                  ),
                                  Text(
                                    'Designer.PDF',
                                    style:
                                        textTheme(context).labelSmall?.copyWith(
                                              color: AppColor.lightBlack,
                                              fontWeight: FontWeight.w400,
                                            ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: AppColor.appGreen,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              backgroundColor: Colors.white,
                              elevation: 0,
                            ),
                            child: Text(
                              'Download',
                              style: textTheme(context).bodyLarge?.copyWith(
                                    color: AppColor.appGreen,
                                  ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.center, // Centering the Row
                              children: [
                                _buildActionButton('Delete', context,
                                    outlined: true),
                                const SizedBox(width: 10),
                                _buildActionButton('Suspend', context,
                                    outlined: true),
                                const SizedBox(width: 10),
                                _buildActionButton('Approve', context),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                // Buttons Row
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(String label, BuildContext context,
      {bool outlined = false}) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        // Remove padding to let Ink handle it
        foregroundColor: outlined ? AppColor.appGreen : Colors.white,
        backgroundColor: outlined ? Colors.white : Colors.transparent,
        side: outlined ? BorderSide(color: AppColor.appGreen) : BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: outlined
              ? null // No gradient for outlined buttons
              : LinearGradient(
                  colors: [
                    colorScheme(context).secondary,
                    colorScheme(context).primary,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Text(
            label,
            style: textTheme(context).bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: outlined ? AppColor.appGreen : Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
